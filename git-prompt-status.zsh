setopt prompt_subst
autoload -U colors
colors
function __prompt_git() {
        local git_dir ref br top;
        git_dir=$(git rev-parse --git-dir 2> /dev/null) || return
        ref=$(git symbolic-ref HEAD 2> /dev/null) || return
        br=${ref#refs/heads/}
        top=$(cat $git_dir/patches/$br/current 2>/dev/null) \
                  && top="/$top"
                  echo "[$br$top]"
}
export PS1='[%?]%{$fg[green]%}%n%{$reset_color%}@%m:%~\$ '
export RPS1='%{$fg[yellow]%}$(__prompt_git) %{$reset_color%}%*'
