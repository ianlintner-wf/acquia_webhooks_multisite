# Purpose

This is an example of how to efficiently run features, updatedb and clear cache on a multi-site installation on acquia 
as a basic CI for your Drupal site.

# Notes
This is a very simple example the basic architecture is two fold.

- Create an array of your multi-site urls and iterate through them.
- Execute a script to perform the drush updates in the background for each site and wait for them to finish.

Pretty straightforward.

If you have any thoughts on problems or ways to make it work better. Submit an issue or PR.


Tags:
Drupal, Drupal Multisite, Acquia, Acquia Webhooks