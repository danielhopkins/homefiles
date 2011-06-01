# RVM stuff 
[[ -s "/Users/dhopkins/.rvm/scripts/rvm" ]] && source "/Users/dhopkins/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export SVN_EDITOR=vi
export EDITOR=vi
export VISUAL=vi
export LSCOLORS=ExFxCxDxBxegedabagacad
export PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'

# Terminal colors (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
SI="\[\033[0;34m\]" #this is for the current directory
IN="\[\033[0m\]"
export PS1="$NM$SI`hostname -s` \$CurDir\$ $NM$IN"

shopt -s histappend

export HISTCONTROL=ignoredups # Ignores dupes in the history
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# Don't complete using the PATH when hitting the completion character on an
# empty line (seeing a list of every binary in the system isn't exactly
# useful).
shopt -s no_empty_cmd_completion



# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind is used instead of setting these in .inputrc.  This ignores case in bash completion
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# Looks worthwhile to check out some of the other notes in this thread
# http://news.ycombinator.com/item?id=2237595

