HISTCONTROL=ignoreboth
shopt -s histappend

HISTSIZE=500
HISTFILESIZE=1000


shopt -s checkwinsize


if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	export PS1='\[$(tput bold)\]\[$(tput setaf 6)\][SSH] \[$(tput setaf 4)\]\u\[$(tput setaf 5)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 2)\]\W \[$(tput setaf 2)\]> \[$(tput sgr0)\]'	
else
	export PS1='\[$(tput bold)\]\[$(tput setaf 4)\]\u\[$(tput setaf 5)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 2)\]\W \[$(tput setaf 2)\]> \[$(tput sgr0)\]'	
fi


if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


alias ll="ls -lah --color=auto"
alias ls="ls -a --color=auto"
alias cp="cp -r"
alias wip="curl https://www.plaintextip.com/ && echo '\n'"
alias lsp="echo $PATH | tr \":\" \" \" | xargs ls | grep -v \"/\""
export EDITOR="micro"
alias back='cd $OLDPWD'
alias ip="ip --color"
alias lsblk="lsblk -f -n -o NAME,SIZE,TYPE,STATE,MOUNTPOINT"
alias sherlock="sherlock --print-found"
alias sqlite3="sqlite3 -table"
alias mount="mount -o X-mount.mkdir"

export YDL="/usr/bin/yt-dlp"
alias ydl="$YDL -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias ydl-wq="$YDL -f 'worstvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "
alias ydl-a="$YDL -f 'bestaudio[ext=m4a]/bestaudio' -o '%(title)s.%(ext)s'"
alias ydl-at="$YDL -f 'bestaudio[ext=m4a]/bestaudio' -o '%(uploader)s - %(title)s.%(ext)s'"

export TERM=xterm
