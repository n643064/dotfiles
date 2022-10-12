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
precmd() {
    vcs_info
}
setopt prompt_subst
VCS='${vcs_info_msg_0_}'
zstyle ':vcs_info:git*' formats "[%s] %F{yellow}%r%F{red}@%F{yellow}%b "

bindkey -e
bindkey ";5C" forward-word
bindkey ";5D" backward-word
bindkey "^[[3~" delete-char-or-list
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey "^Z" undo



if [[ $UID == 0 || $EUID == 0 ]]
then
	ind="%F{red}[#]"
else
	ind="%F{magenta}$"
fi

PS1="%F{yellow}%n%F{blue}%B@%b%F{red}%m%F{green} %~ %F{magenta}$VCS$ind %F{white}"

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
alias p="ps aux"
alias ll="ls -lah --color=auto"
alias ls="ls --color=auto"
alias cp="cp -r"
export YDL="/usr/bin/yt-dlp"
alias ydl="$YDL -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias ydl-wq="$YDL -f 'worstvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias ydl-a="$YDL -f 'bestaudio[ext=m4a]/bestaudio' -o '%(title)s.%(ext)s'"
alias ydl-at="$YDL -f 'bestaudio[ext=m4a]/bestaudio' -o '%(uploader)s - %(title)s.%(ext)s'"
alias wip="curl https://www.plaintextip.com/ && echo '\n'"
alias lsp="echo $PATH | tr \":\" \" \" | xargs ls | grep -v \"/\""
export PATH=$PATH:$HOME/apps
export EDITOR="micro"
alias back='(){cd $OLDPWD}'
alias bat="batcat"
# This is the useless part
alias cmatrix="cmatrix -C red"
alias ip="ip --color"
alias lsblk="lsblk -n -o NAME,SIZE,TYPE,STATE,MOUNTPOINT"
alias sherlock="sherlock --print-found"
alias icat="kitty +kitten icat"
