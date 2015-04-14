
# Color Vars
Black='\e[0;30m'
Red='\e[0;31m'
Green='\e[0;32m'
Blue='\e[0;34m'
Default='\e[0m'

# Choose your Color
MyColor=$Green

export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[$MyColor\]\u\[$Default\]@\[$MyColor\]\h\[$Default\] [\[$MyColor\]\W\[$Default\]] \$ "
source ~/.vim/configurations/bash/laravel/.bashrc
source ~/.vim/configurations/bash/php/.bashrc

