#!/bin/bash

#$1 drush_alias
#$2 site uri
#$3 is target_enviornment

drush_alias=$1

echo "Running Updates for $2"
drush @$drush_alias --uri=$2 updatedb -y

# Execute a drush revert features
echo "Reverting Features for $2"
drush @$drush_alias --uri=$2 features-revert-all -y

# Disable modules
if [ "$3" = "prod" ];
then
  echo "Disabling devel for $2"
  drush @$drush_alias --uri=$i pm-disable devel -y


  echo "Disabling views for $2"
  drush @$drush_alias --uri=$2 pm-disable views_ui -y
fi

#disable dblog
drush @$drush_alias -uri=$2 pm-disable dblog -y

# Execute a drush clear cache
echo "Clearing Cache for $2"
drush @$drush_alias --uri=$2 cc all
