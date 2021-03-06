export CLICOLOR=1
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home"
export PATH=/usr/local/bin:/Users/dhopkins/bin:$PATH

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -h'
alias l='ls'
alias ll='ls -lh'
alias la='ll -a'
alias ipfw='sudo ipfw'
alias mvi='mvim'
alias sudoedit='sudo -e'
alias gotmp='cd $(mktemp -d /tmp/XXXXXXXXXXXXXXXX)'

# Fix Line Endings
alias fle="perl -pi -e 's/\r\n?/\n/g'"
alias grep='grep -s --color'
alias fgrep='xargs grep -s --color'
alias mysql=mysql5

function ppjson(){ cat "$1" | python2.6 -m simplejson.tool | tee "$1"; }
#psgrep () {
#    pids="$(pgrep -d, "$@")"
#    if [ "x$pids" != "x" ]; then
#        ps ux -p $pids
#    fi
#}

ppsgrep () {
    pids="$(pgrep -d, "$@")"
    if [ "x$pids" != "x" ]; then
        ps ux --pid $pids --ppid $pids
    fi
}

# git command completetion
source ~/bin/git-completion.bash

source ~/.bashrc
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Taken from here: http://blog.zerodogg.org/2007/04/21/bash-ssh-host-completion/ 
complete -C "perl -le'\$p=qq#^\$ARGV[1]#;@ARGV=q#$HOME/.ssh/config#;/\$p/&&/^\D/&&not(/[*?]/)&&print for map{split/\s+/}grep{s/^\s*Host(?:Name)?\s+//i}<>'" ssh

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

# RVM stuff 
# [[ -s "/Users/dhopkins/.rvm/scripts/rvm" ]] && source "/Users/dhopkins/.rvm/scripts/rvm"  # This loads RVM into a shell session.
