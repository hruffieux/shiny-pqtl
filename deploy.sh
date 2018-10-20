#!/bin/sh

set -e

echo "Deploy new version of app to Shiny Server"

echo -n "Copying new application files ... "
sudo rsync -avz ./ /srv/shiny-server/
echo "done."

echo -n "Restarting Shiny Server ... "
sudo systemctl restart shiny-server
echo "done."

