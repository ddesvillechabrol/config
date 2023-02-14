# Options
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate ""
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate ""
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_branch $fish_color_operator
set -g __fish_git_prompt_color_stagedstate $fish_color_cwd
set -g __fish_git_prompt_color_dirtystate $fish_color_host
set -g __fish_git_prompt_color_invalidstate $fish_color_error
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate $fish_color_quote

function fish_prompt --description 'Write out the prompt'
	set -l color_cwd
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    echo -n -s (set_color $fish_color_quote) "$USER" (set_color normal) @ (set_color $fish_color_host) (prompt_hostname) ' ' (set_color $fish_color_cwd) (prompt_pwd) (__fish_git_prompt) (set_color normal) "$suffix "
end
