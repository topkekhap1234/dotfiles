# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias v='nvim'
alias f='fastfetch'
alias em='emacsclient -c -a ""'
alias poweroff='sudo poweroff'
alias dotpush='cd ~/.dotfiles && git add . && git commit -m "update" && git push && cd -'
alias emacs-reboot='emacsclient -e "(kill-emacs)" ; emacs --daemon'

# Переносим историю Python в .config/python (нужно будет создать папку)
export PYTHONSTARTUP="$HOME/.config/python/pythonrc"
export PYTHONHISTORY="$HOME/.config/python/history"

# Переносим конфиг и лог wget в .config/wget
export WGETRC="$HOME/.config/wget/wgetrc"


export EDITOR="emacs"
export VISUAL="emacs"
PS1='[\u@\h \W]\$ '


export PATH=$PATH:/usr/lib/jvm/openjdk21/bin
