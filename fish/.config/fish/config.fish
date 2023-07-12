set -gx TERM "xterm-256color"
set fish_prompt_pwd_dir_length 3
starship init fish | source

# set lazygit
set -gx LG_CONFIG_FILE $HOME/.config/lazygit/config.yml

# set pyenv
set -gx PATH "$HOME/.pyenv/bin" $PATH
pyenv init - | source

# set rust
set -gx PATH "$HOME/.cargo/bin" $PATH

# aliases
alias nvdiff "nvim -d"

# set volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# set local bin
set -gx PATH "$HOME/.local/bin" $PATH

# set go
set -gx PATH "/usr/local/go/bin" $PATH

# add key if absent from ssh-agent
ssh-add -l > /dev/null 2>&1
if begin; test $status -eq 1; and __ssh_agent_is_started; end
    ssh-add $HOME/.ssh/id_ed25519
end

