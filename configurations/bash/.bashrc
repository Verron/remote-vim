
# Color Vars
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt

Black='\e[0;30m'
Red='\e[0;31m'
Green='\e[0;32m'
Yellow='\e[0;33m'
Blue='\e[0;34m'
Default='\e[0m'

# Choose your Color
if [ -n "${PromptColor+1}" ]; then
    MyColor="${!PromptColor}"
else
    MyColor=$Default
fi

# Setup Bash Prompt
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[$MyColor\]\u\[$Default\]@\[$MyColor\]\h\[$Default\] [\[$MyColor\]\W\[$Default\]] \$ "

# Import other .bashrc files
source ~/.vim/configurations/bash/laravel/.bashrc
source ~/.vim/configurations/bash/php/.bashrc

