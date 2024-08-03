set -gx TERM "xterm-256color"
set fish_prompt_pwd_dir_length 3

# set lazygit
set -gx LG_CONFIG_FILE $HOME/.config/lazygit/config.yml

# set pyenv
set -gx PATH "$HOME/.pyenv/bin" $PATH
pyenv init - | source

# set volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# set local bin
set -gx PATH "$HOME/.local/bin" $PATH

# aliases
alias nvdiff "nvim -d"

starship init fish | source
