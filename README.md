# .dotfiles

To easily install, clone the repository to your home directory and follow the instruction:

```
git clone https://github.com/ddesvillechabrol/.dotfiles.git
```
## Setup the shell
> **_NOTE_** I did this list of command after install all stuff for gaming. It may miss some deps sorry !

Install fish and set fish as the main shell. After these commands you'll need to restart your session.
```
sudo dnf install fish fzf ripgrep cmake shellcheck stow
stow fish
echo /usr/bin/fish  | sudo tee -a /etc/shells
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

## Setup wezterm
Install the patched iovetska font and stow wezterm directory.
```
cd font && tar xz iosevka_extended_nerd_font.txz
sudo mkdir -p /usr/local/share/fonts/truetype/
sudo cp IosevkaExtendedNF/*ttf /usr/local/share/fonts/truetype/
fc-cache -fv
stow wezterm
```

## Setup starship and some rust tools
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup override set stable
rustup update stable
cargo install starship --locked
stow starship
```

## Setup git
Install pretty git logline, thanks to Mattias [link](https://ma.ttias.be/pretty-git-log-in-one-line/).
```
git config --global alias.logline "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
mkdir /tmp/lazygit && cd /tmp/lazygit && set LAZYGIT_VERSION 0.40.2
curl -sLO https://github.com/jesseduffield/lazygit/releases/download/v$LAZYGIT_VERSION/lazygit_LAZYGIT_VERSION_Linux_x86_64.tar.gz
tar zxf lazygit_LAZYGIT_VERSION_Linux_x86_64.tar.gz
mkdir -p ~/.local/bin && mv /tmp/lazygit/lazygit ~/.local/bin
cd -
stow lazygit
```

## Install LSP
```
curl https://get.volta.sh | bash && volta install node
npm install -g pyright
npm install -g vscode-langservers-extracted
npm install -g @tailwindcss/language-server
npm install -g typescript typescript-language-server
npm install -g @fsouza/prettierd
npm install -g bash-language-server
npm install -g jsonlint
rustup component add rust-analyzer
ln -s "$(rustup which --toolchain stable rust-analyzer)" "$HOME/.cargo/bin"
rustup component add rustfmt
pip install --user ruff-lsp
```
Install lua-language-server
```
mkdir -p ~/Software/lua-language-server/
set LUALSP_VERSION 3.7.3
curl -sLO https://github.com/LuaLS/lua-language-server/releases/download/$LUALSP_VERSION/lua-language-server-$LUALSP_VERSION-linux-x64.tar.gz
tar -xf lua-language-server-$LUALSP_VERSION-linux-x64.tar.gz -C ~/Software/lua-language-server/
touch ~/.local/bin/lua-language-server && chmod 750 ~/.local/bin/lua-language-server
echo '#!/bin/bash' > ~/.local/bin/lua-language-server
echo 'exec "/home/dimitri/.local/bin/lua-language-server" "$@"' >> ~/.local/bin/lua-language-server
```

## Change flavour

You can use the following Python script to switch the flavour:
```
python path/to/.dotfiles/change_flavour.py --flavour latte
```

Note that any opened instances of nvim will not be updated. However, you can change the flavour on the fly using:
```
:Catppuccin latte
```

