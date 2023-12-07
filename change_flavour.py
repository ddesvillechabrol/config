# I need to modify some file to update catppuccin flavour in the config

# NEOVIM
# modify lavour in vim/.config/nvim/after/plugins/color.lua
#   change first line `local flavour = "latte"`

# Alacritty (alacritty/.config/alacritty/alacritty.yml)
# modify yaml file to change theme
#  `import: ["~/.config/alacritty/catppuccin/catppuccin-latte.yml"]`

# tmux tmux/.tmux.conf
# modify config file
# set -g @catppuccin_flavour 'latte'

# fish
# update theme -> `fish_config theme save "Catppuccin Latte"`
import argparse
import subprocess
from pathlib import Path


parser = argparse.ArgumentParser(
    description="Command line to change the catppuccin falvour for Alacritty, Nvim, Fish and Tmux."
)
parser.add_argument(
    "-f",
    "--flavour",
    type=str,
    choices=["latte", "frappe", "macchiato", "mocha"],
    required=True,
    help="Choose your catppuccin flavour !",
)
parser.add_argument(
    "-o",
    "--opacity",
    type=str,
    help="Set alacritty opacity between 0 and 1."
)


def main():
    args = parser.parse_args()
    dotfiledir = Path(__file__).parent

    # Nvim
    color_file = Path(f"{dotfiledir}/vim/.config/nvim/after/plugin/color.lua")
    nvim_text = color_file.read_text().split("\n", 1)[-1]
    with open(color_file, "w") as filout:
        print(f'local flavour = "{args.flavour}"', file=filout)
        filout.write(nvim_text)

    # Wezterm
    wezterm_conf = Path(f"{dotfiledir}/wezterm/.wezterm.lua")
    wezterm_text = []
    with open(wezterm_conf) as filin:
        for line in filin:
            if line.startswith("config.color_scheme"):
                wezterm_text.append(f"config.color_scheme = 'Catppuccin {args.flavour.capitalize()}'")
            elif args.opacity and line.startswith("config.window_background_opacity"):
                wezterm_text.append(f"config.window_background_opacity = {args.opacity}")
            else:
                wezterm_text.append(line.rstrip())
    wezterm_conf.write_text("\n".join(wezterm_text))

    # Starship
    starship_conf = Path(f"{dotfiledir}/starship/.config/starship.toml")
    starship_text = []
    with open(starship_conf, "r") as filin:
        for line in filin:
            if 'palette = "catppuccin' in line:
                starship_text.append(f'palette = "catppuccin_{args.flavour}"')
            else:
                starship_text.append(line.rstrip())
    starship_conf.write_text("\n".join(starship_text))

    # fish
    subprocess.run(
        ["fish", "-c", f'fish_config theme save "Catppuccin {args.flavour.capitalize()}"'],
        input="yes\n",
        text=True,
    )

    # tmux
    tmux_conf = Path(f"{dotfiledir}/tmux/.tmux.conf")
    tmux_text = []
    with open(tmux_conf , "r") as filin:
        for line in filin:
            if "@catppuccin_flavour" in line:
                tmux_text.append(f"set -g @catppuccin_flavour '{args.flavour}'")
            else:
                tmux_text.append(line.rstrip())
    tmux_conf.write_text("\n".join(tmux_text))


if __name__ == "__main__":
    main()
