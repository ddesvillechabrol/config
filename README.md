# Config

A simple reminder to install all my tools and config.

## Tools

- [Wezterm](https://wezfurlong.org/wezterm/index.html)
- [Poetry](https://python-poetry.org/)
- [Volta](https://volta.sh/)
- [Starship](https://starship.rs/)

## Fish
Install fish shell and some dependencies
```
sudo dnf install fish fzf ripgrep cmake shellcheck stow
mkdir ~/.config/fish && cp fish/config.fish ~/.config/fish/
echo /usr/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/bin/fish
```

Install fish plugins with fisher.
```
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
fisher install catppuccin/fish
fisher install danhper/fish-ssh-agent
fish_config theme save "Catppuccin Mocha"
```

## Git
Install pretty git logline, thanks to Mattias [link](https://ma.ttias.be/pretty-git-log-in-one-line/).
```
git config --global alias.logline "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

## Patch Iosevka Font to have extended

```
mkdir Iosevka && cd Iosevka && \
    curl -SL https://github.com/be5invis/Iosevka/releases/download/v31.0.0/PkgTTF-Iosevka-31.0.0.zip
unzip PkgTTF-Iosevka-31.0.0.zip && mkdir Extended && mv *Extended* Extended && mkdir ExtendedNF
docker run --rm -v $(realpath Extended/):/in:Z -v $(realpath ExtendedNF):/out:Z -e "PN=8" nerdfonts/patcher
sudo mkdir -p /usr/local/share/fonts/truetype/
sudo cp ExtendedNF/*ttf /usr/local/share/fonts/truetype/
fc-cache -fv
```

