#!/bin/bash
DROPBOX_FOLDER='/Users/dhopkins/Dropbox'
LOG_FILE='/var/log/hazelcron.log'
{
    echo $(date) 
    # Stop if there is no Dropbox folder. If it exists then do do some setup of the special folders, if they have been removed.
    [ ! -e $DROPBOX_FOLDER ] && { echo 'no dropbox'; exit 1; } 
    [ ! -e $DROPBOX_FOLDER/Public/week ] && mkdir -v $DROPBOX_FOLDER/Public/week
    [ ! -e $DROPBOX_FOLDER/Public/hour ] && mkdir -v $DROPBOX_FOLDER/Public/hour

    find $DROPBOX_FOLDER/Public/week/ -type f -mtime +7d -exec rm -v {} \;
    find $DROPBOX_FOLDER/Public/hour/ -type f -mtime +1h -exec rm -v {} \;

    # Move any extra files into the perm area
    find $DROPBOX_FOLDER/Public -type f -depth 1 -and -not -name '*Icon*' -and -not -name '.*' -exec mv -v {} $DROPBOX_FOLDER/Public/perm \;
} >> $LOG_FILE
