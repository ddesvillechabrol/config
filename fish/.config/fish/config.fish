set fish_prompt_pwd_dir_length 3

# set anaconda
source /home/desvillechabrol/miniconda3/etc/fish/conf.d/conda.fish 

# set pyenv
pyenv init - | source

# set rust
set -gx PATH "$HOME/.cargo/bin:$PATH"

# aliases
alias nvdiff "nvim -d"

set -gx TERM "xterm-256color"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx PATH "$HOME/.local/bin" $PATH

