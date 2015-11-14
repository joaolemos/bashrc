#=============================================================
#
# My Bashrc
# By Joao Lemos <no-email>
#
# This file is read (normally) by interactive shells only.
# Here is the place to define your aliases, functions and
# other interactive features like your prompt.
#
# Based on:
#
# http://tldp.org/LDP/abs/html/sample-bashrc.html
# By Emmanuel Rouat <no-email>
#
#=============================================================

# --> Comments added by HOWTO author.


#-------------------------------------------------------------
# Source global definitions (if any)
# Based on Debian Wheezy (results may vary)
#-------------------------------------------------------------


if [ -f /etc/bash.bashrc  ]; then
        . /etc/bash.bashrc  # --> Read /etc/bashrc, if present.
fi

#-------------------------------------------------------------
# Some settings
#-------------------------------------------------------------

ulimit -S -c 0          # Don't want any coredumps.
set -o notify
set -o noclobber
set -o ignoreeof
#set -o nounset
#set -o xtrace          # Useful for debuging.

# Enable options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob        # Necessary for programmable completion.

# Disable options:
shopt -u mailwarn
unset MAILCHECK         # Don't want my shell to warn me of incoming mail.


export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTTIMEFORMAT="%H:%M > "
export HISTIGNORE="&:bg:fg:ll:h"
export HOSTFILE=$HOME/.hosts    # Put list of remote hosts in ~/.hosts ...

export PATH=$PATH:/home/$USER/android-sdk-linux/tools:/home/$USER/android-sdk-linux/platform-tools:/home/$USER/apps/appengine-java-sdk-1.9.25/bin:/home/$USER/apps/apache-maven-3.3.3/bin:/home/$USER/apps/scala/scala-2.11.7/bin:/home/$USER/apps/scala/sbt/bin

#-------------------------------------------------------------
# Greeting, motd etc...
#-------------------------------------------------------------

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'              # No Color
# --> Nice. Has the same effect as using "ansi.sys" in DOS.


# Looks best on a terminal with black background.....
echo -e "${CYAN}This is BASH ${RED}${BASH_VERSION%.*}\
${CYAN} - DISPLAY on ${RED}$DISPLAY${NC}\n"
date
if [ -x /usr/games/fortune ]; then
    /usr/games/fortune -s     # Makes our day a bit more fun.... :-)
fi

#-------------------------------------------------------------
# Shell Prompt
#-------------------------------------------------------------

PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\n\[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

#-------------------------------------------------------------
# Source bash aliases (if any)
#-------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

#-------------------------------------------------------------
# Source bash programming completion (if any)
#-------------------------------------------------------------
if [ -f ~/.bash_completion ]; then
        . ~/.bash_completion
fi

# Local Variables:
# mode:shell-script
# sh-shell:bash
# Ent:

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# i3 commands for development
alias webdev="i3-msg 'workspace 2 : dev; append_layout /home/$USER/.i3/workspace-dev.json; exec /home/jlemos/apps/Sublime\ Text\ 2/sublime_text; exec firefox; exec i3-sensible-terminal \"$PWD\"; exec i3-sensible-terminal \"$PWD\";'"
alias web="i3-msg 'workspace 3 : web; exec firefox;'"
alias mail="i3-msg 'workspace 4 : mail; exec thunderbird;'"

# Cpan
PATH="/home/jlemos/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/jlemos/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/jlemos/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/jlemos/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jlemos/perl5"; export PERL_MM_OPT;
