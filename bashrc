[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --depth 3 -g ""'
export FZF_DEFAULT_OPTS='--height 40% -e'
export FZF_CTRL_T_COMMAND='ag --depth 3 -g ""'
export PATH=$HOME/bin:$PATH
export TERM=xterm-256color
source $HOME/z/z.sh
alias Z='>/dev/null 2>&1 _z $(z | fzf) '
