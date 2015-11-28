#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias l="ls -la"
alias emacs="emacs -nw"
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

export TERM=xterm-256color
 
. $HOME/i3setup/gruvbox/gruvbox_256palette.sh 

. $HOME/torch/install/bin/torch-activate


. /home/soundlocate/torch/install/bin/torch-activate

xrdb -merge  $HOME/.Xresources

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
