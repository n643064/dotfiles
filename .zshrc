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

if [[ $UID == 0 || $EUID == 0 ]]
then
ind="%F{red}[#]"
else
ind="%F{green}$"
fi

PS1="%F{purple}%n%F{green}@%F{purple}%m%F{blue} %~ %F{purple}$VCS$ind%F{white} "

zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

alias work="cd $HOME/Workspace"
alias idea="cd $HOME/IdeaProjects"
alias charm="cd $HOME/PycharmProjects"
alias p="ps aux"
alias ls="ls --color=auto"
alias yay="yay --sudo /usr/bin/doas"
alias lite='(){lite $1 & disown}'
alias ydl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias ydl-wq="youtube-dl -f 'worstvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias ydl-a="youtube-dl -f 'bestaudio[ext=m4a]/bestaudio' --merge-output-format mp3 "
alias wip="curl https://www.plaintextip.com/ && echo '\n'"

alias radio-swing="mpv http://lainon.life:8000/swing.mp3"

export PATH=$PATH:$HOME/apps
