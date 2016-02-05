#!/bin/bash




pwd="$(pwd)"
kDir="$pwd/.k"

#----------------------------------------
# We execute the script ONLY IF .k dir does not exist 
#----------------------------------------
if [ ! -d "$kDir" ]; then
 
 
    editor=vim
    if [ -n "$1" ]; then
        editor="$1"
    fi
    
    
    #----------------------------------------
    # CREATE THE STRUCTURE
    #----------------------------------------
    mkdir "$kDir"
    cd "$kDir"
    touch k_aliases.sh k_functions.sh k_environment_variables.sh k_sources.sh
    
    /bin/cat <<EOM >k_aliases.sh
    
#-------------------------------------
# K NATIVE ALIASES
#-------------------------------------
alias kalias='$editor ~/.k/k_alias.sh'
alias kaliass='. ~/.k/k_alias.sh'
alias kfunc='$editor ~/.k/k_functions.sh'
alias kfuncs='. ~/.k/k_functions.sh'
alias kenv='$editor ~/.k/k_environment_variables.sh'
alias kenvs='. ~/.k/k_environment_variables.sh'
alias ksource='$editor ~/.k/k_sources.sh'
alias ksources='. ~/.k/k_sources.sh'


#-------------------------------------
# MAIN PROGRAM LOGS AND SERVICE 
#-------------------------------------
# the principe is to start with the first letter of the service twice,
# followed by log for error log, and alog for access log (web server only)

alias aalog='tail -f /var/log/apache2/error.log'
alias aaalog='tail -f /var/log/apache2/access.log'
alias aar='service apache2 restart'

alias nnlog='tail -f /var/log/nginx/error.log'
alias nnalog='tail -f /var/log/nginx/access.log'
alias nnr='service nginx restart'

alias sslog='tail -f /var/log/syslog'

alias hhlog='tail -f /var/log/auth.log'

EOM
    
    
    
    /bin/cat <<EOM >k_functions.sh
    
mcd () { mkdir -p "$1" && cd "$1"; }

path(){
  echo $PATH | tr ':' '\n' | xargs ls -ld 
}

importconf (){
    # todo: import ling's tmux or ling's git confs
}

EOM


    cd "$pwd"

    #----------------------------------------
    # APPEND TO THE .bashrc FILE 
    # only if .bashrc exists (ensure the user is in a user's home directory) 
    # AND the k stuff is not there already
    #----------------------------------------
    if [ -f ".bashrc" ]; then

        if ! grep -q "# kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk" ".bashrc"; then
        
            cat >>".bashrc" <<EOF
    
# kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
#  	 ____ 
# 	||K ||
# 	||__||
# 	|/__\|
#
# kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

. "$DIR/.k/k_aliases.sh"
. "$DIR/.k/k_functions.sh"
. "$DIR/.k/k_environment_variables.sh"
. "$DIR/.k/k_sources.sh"
    
    
EOF
            
            . ".k/k_aliases.sh"            
            . ".k/k_functions.sh"            
            . ".k/k_environment_variables.sh"            
            . ".k/k_sources.sh"            
            
            
        fi
    fi
    

fi