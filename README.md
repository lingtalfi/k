K
==========
2016-02-06


K get kool alias (and more) working with a simple one-liner. 


Features
----------

- install with one line from the web
- automatically re-organize your .bashrc in 4 files: aliases, functions, environment and sources
- creating new aliases is easy
- creating new functions is easy
- adding new environment variables is easy
- adding new sources is easy 


That's it.




How to use
---------------

Go to your home directory, then call the install url
(you need curl or wget installed to run the following example, just choose one)

```bash
cd
source <(curl -s https://raw.githubusercontent.com/lingtalfi/k/master/script/k_installer.sh)

# alternative using nano as the default editor instead of vim
curl -s https://raw.githubusercontent.com/lingtalfi/k/master/script/k_installer.sh | bash /dev/stdin nano

# alternative using open (mac) as the default editor instead of vim
curl -s https://raw.githubusercontent.com/lingtalfi/k/master/script/k_installer.sh | bash /dev/stdin open

# wget alternative 
bash <(wget -qO- https://raw.githubusercontent.com/lingtalfi/k/master/script/k_installer.sh)

# wget alternative using nano as the default editor instead of vim
wget -qO- https://raw.githubusercontent.com/lingtalfi/k/master/script/k_installer.sh | bash -s -- nano
```

To see what this does, see the "k structure" section below.


Then, to edit/create an alias:

```bash
kalias
```

Once edited, source it by adding the s (for source) to the kalias command.

```bash
kaliass
```

This also works for functions, environment variables and sources.

```bash
# functions 
kfunc
kfuncs

# environment variables 
kenv
kenvs

# sources
ksource
ksources
```

You might ask what is source used for.

K use the term source for files that you want to source right off the bat, as you login.
For instance, I personally use a framework to bookmark the location where 
I go, called [bashmarks](https://github.com/huyng/bashmarks).

To configure it, I can edit the source file (using the ksource alias), and then put the following 
content in it: 


```bash
. /home/ling/bin/bashmarks.sh
```


As a bonus, there a few aliases for web standard programs that I use.





The k structure
--------------------

When you one-line install k, it automatically creates the following structure in the 
current directory where you are (which should be your user's home directory):


```bash
- .k/ 
----- k_aliases.sh
----- k_functions.sh
----- k_environment_variables.sh
----- k_sources.sh
```


Then, it appends the following lines to your .bashrc (unless it's already there)
 

```bash
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

```

Those special files are called "k files".
They are all empty by default, except the k_aliases file, which 
contains some useful aliases (see k native aliases section).
 
 
 
k native aliases 
---------------------


```bash
#-------------------------------------
# K NATIVE ALIASES
#-------------------------------------
alias kalias='vim ~/.k/k_alias.sh'
alias kaliass='. ~/.k/k_alias.sh'
alias kfunc='vim ~/.k/k_functions.sh'
alias kfuncs='. ~/.k/k_functions.sh'
alias kenv='vim ~/.k/k_environment_variables.sh'
alias kenvs='. ~/.k/k_environment_variables.sh'
alias ksource='vim ~/.k/k_sources.sh'
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






```


The default editor to open files is vim, but it can be changed when you 
invoke the install program (first argument).


k native functions
----------------------


```bash 
mcd () { mkdir -p "$1" && cd "$1"; }

path () {
  echo $PATH | tr ':' '\n' | xargs ls -ld 
}

importconf () {
    # todo: import ling's tmux or ling's git confs
}
```




Ideas
---------

Create a native function that copies the k dir to another user's home directory (and configure the .bashrc)





History Log
------------------
    
- 1.0.0 -- 2016-02-06

    - initial commit
    
    





