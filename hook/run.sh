#!/bin/sh
echo "********************"
cd /var/www/blog/
rm -rf build
rm -rf node_modules
yarn
yarn run build
echo "--------------------"
echo "add '?ver=1' in css file"
vi /var/www/blog/build/index.html
echo "--------------------"
echo "Website is running"
echo "********************"
