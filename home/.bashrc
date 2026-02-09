# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias v='nvim'
alias f='fastfetch'
alias em='emacs -nw'
alias poweroff='sudo poweroff'

export EDITOR="emacs"
export VISUAL="emacs"
PS1='[\u@\h \W]\$ '


export PATH=$PATH:/usr/lib/jvm/openjdk21/bin
