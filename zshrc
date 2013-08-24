
# Important variable setting --------------------------------------------------
export ENV_ROOT="/home/majoros/git/myenv"
export DOTFILES_ROOT="${ENV_ROOT}/.dotfiles"
export BUNDLE_ROOT="${ENV_ROOT}/bundles"
export BUNDLE_ROOT_STR="${BUNDLE_ROOT}/{}"


# Colors ----------------------------------------------------------
export TERM=screen-256color

# Editors ----------------------------------------------------------
export EDITOR='vim'
export EDITORPIPED='vim'
export GIT_EDITOR='vim'
export FB_EDITOR='vim -X'
export PAGER=less
export VISUAL=less
export LESS='-M -S'

# Locale's ---------------------------------------------------------

export LC_ALL="en_US.UTF-8"

# Misc -------- ----------------------------------------------------
bindkey -v
#set term -blength 0
#set bell-style none
setopt AUTO_CONTINUE # Background processes aren't killed on exit of shell
setopt NO_BG_NICE # Don't nice background processes

# Aliases ----------------------------------------------------------

alias h=history
alias ducks='du -cks * | sort -rn' # Lists folders and files sizes in the current folder
alias ll="/bin/ls -l"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ymd="date '+%Y%m%d'"
alias ymdhms="date '+%Y%m%d%H%M%S'"
alias vim="vim -X"
alias ejil='echo "" | vpipe |jil'
alias pjil=' vpipe |jil'
alias vpipe='~/sbin/pipe'

alias -g ttl=" | awk '{ttl+=\$1} END{print ttl}'"
alias -g avg=" | awk '{ttl+=\$1; count++} END{print ttl/count}'"

## history  -----------------------------------------------------------------

if [ -n "$TMUX" ]; then
        export TMUX_SESSION_ID=$(tmux list-windows |grep active |awk '{print $1}' |sed 's/://')
        export HISTFILE=~/tmp/.zsh/history/tmux_history.$TMUX_SESSION_ID
else
        export HISTFILE=~/tmp/.zsh/history/default
fi

export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=2500
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

## pattern matching --------------------------------------------------------

setopt extended_glob
setopt numericglobsort

## include sub files --------------------------------------------------------

. ~/.zsh/vim.zsh
. ~/.zsh/misc.zsh
. ~/.zsh/auto_cmpl.zsh

## Set the PS1 variable -----------------------------------------------------

export PS1='[%?/%j/%5v]$ '

precmd() {
    if [[ -n $TMUX_SESSION_ID && ( ${TERM} == screen* ) ]]
    then
        echo -n "\ek$INST [$(hostname -s)]\e\\"
    fi
}

