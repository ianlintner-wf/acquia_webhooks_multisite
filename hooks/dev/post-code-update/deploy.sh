#!/bin/bash
#
# Cloud Hook: deploy
#
# An example of how to run features, updates and cc on a multi site in parallel
#Args example post-code-deploy site target-env source-branch deployed-tag repo-url repo-type
#This script works as any cloud hook


# Map the script inputs to convenient names.
site=$1
target_env=$2
drush_alias=$site'.'$target_env

echo "Deploying $1 $2 branch $3 or tag $4 from $5 of type $6"

######################################
## Site list default to dev         ##
######################################
prod_sites=( "www.example.com" "www2.example.com" "www3.example.com" )
test_sites=( "stage.example.com" "stage2.example.com" "stage3.example.com" )
dev_sites=( "dev.example.com" "dev2.example.com" "dev3.example.com" )
current_sites=( "${dev_sites[@]}" )

######################################
## Determine site list for env      ##
######################################
if [ "$target_env" = "prod" ];
then
  current_sites=( "${prod_sites[@]}" )
elif [ "$target_env" = "test" ];
then
  current_sites=( "${test_sites[@]}" )
fi

######################################
## Loop through site lists and exec ##
######################################
for i in ${current_sites[@]}; do
  # Run proc in background.
  ../../../tools/acquia/site-update.sh $drush_alias $i $target_env &
done

# Wait for all procs to finish.
wait
