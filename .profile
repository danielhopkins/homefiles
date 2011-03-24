export CLICOLOR=1
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home"
export FLEX_HOME="/Applications/Adobe Flash Builder 4 Plug-in/sdks/4.1.0"
export MANPATH=/opt/local/share/man:$MANPATH
export MAGICK_HOME="/opt/local"
#export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/ImageIO.framework/Versions/A/Resources/:$MAGICK_HOME/lib"
export PGDATA=/opt/local/var/db/postgresql84/defaultdb
export PATH=/Users/dhopkins/bin:/opt/local/lib/postgresql84/bin/:/opt/local/bin:/opt/local/sbin:$PATH

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -h'
alias l='ls'
alias ll='ls -lh'
alias la='ll -a'
alias ipfw='sudo ipfw'
alias mvi='mvim'
alias startpostgres='sudo -iu postgres /opt/local/lib/postgresql84/bin/pg_ctl -D $PGDATA -l /tmp/logfile start'
alias stoppostgres='sudo -iu postgres /opt/local/lib/postgresql84/bin/pg_ctl -D $PGDATA stop'
alias startmysql='sudo -l > /dev/null;sudo /opt/local/bin/mysqld_safe5 &'
alias stopmysql='/opt/local/bin/mysqladmin5 -u root -p shutdown'
alias startvmware='sudo /Library/Application\ Support/VMware\ Fusion/boot.sh --start'
alias stopvmware='sudo /Library/Application\ Support/VMware\ Fusion/boot.sh --stop'
alias sudoedit='sudo -e'

# Fix Line Endings
alias fle="perl -pi -e 's/\r\n?/\n/g'"
alias grep='grep -s --color'
alias fgrep='xargs grep -s --color'
alias mysql=mysql5

function ppjson(){ cat "$1" | python2.6 -m simplejson.tool | tee "$1"; }
psgrep () {
    pids="$(pgrep -d, "$@")"
    if [ "x$pids" != "x" ]; then
        ps ux -p $pids
    fi
}

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
