#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias pr="vblank_mode=0 primusrun"
alias l="ls -la"
alias emacs="emacs -nw"
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

# Trackpoint scrolling
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.5

synclient TouchpadOff=1

xset -b

export TERM=xterm-256color
 
source /home/robin/i3setup/gruvbox/gruvbox_256palette.sh 

. /home/robin/torch/install/bin/torch-activate
