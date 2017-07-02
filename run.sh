#!/bin/sh
echo "********************"
rm -rf /var/www/blog/build
rm -rf /var/www/blog/node_modules
yarn
yarn run /var/www/blog/build
echo "--------------------"
echo "********************"
