HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=2000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME

setopt autocd extendedglob notify

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() 
{
    vcs_info
}
setopt prompt_subst
VCS='${vcs_info_msg_0_}'
zstyle ':vcs_info:git*' formats "%F{red}[%F{blue}%r%F{red}@%F{cyan}%b%F{red}]"

bindkey -e
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "^[[3~" delete-char-or-list
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^Z" undo


PS1="%F{blue}%n %F{cyan}%~%F{magenta} $VCS %F{blue}%% %F{white}"

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
alias p="ps aux"
alias ll="ls -lah --color=auto"
alias ls="ls --color=auto"
alias cp="cp -r"
alias wip="curl https://www.plaintextip.com/ && echo '\n'"
alias lsp="echo $PATH | tr \":\" \" \" | xargs ls | grep -v \"/\""
export PATH=$PATH:$HOME/apps
export EDITOR="micro"
alias back='(){cd $OLDPWD}'
alias ip="ip --color"
alias lsblk="lsblk -n -o NAME,SIZE,TYPE,STATE,MOUNTPOINT"
alias sherlock="sherlock --print-found"
alias fdisk="fdisk --wipe=never"
source .zshrc-ydl
test -r /home/nick/.opam/opam-init/init.zsh && . /home/nick/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
