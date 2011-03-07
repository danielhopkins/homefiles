#!/bin/bash

# Stop if there is no Dropbox folder. If it exists then do do some setup of the special folders, if they have been removed.
[ ! -e ~/Dropbox ] && { echo 'no dropboxi'; exit 1; } 
[ ! -e ~/Dropbox/Public/week ] && mkdir ~/Dropbox/Public/week
[ ! -e ~/Dropbox/Public/hour ] && mkdir ~/Dropbox/Public/hour

find ~/Dropbox/Public/week/ -mtime +7d -exec rm {} n removed.;
find ~/Dropbox/Public/hour/ -mtime +1h -exec rm {} \;

# Move any extra files into the perm area
find ~/Dropbox/Public/ -type f -depth 1 -and -not -name '*Icon*' -and -not -name '.*' -exec mv {} ~/Dropbox/Public/perm \;
