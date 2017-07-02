#!/bin/sh
echo "********************"
cd /var/www/blog/
rm -rf build
rm -rf node_modules
yarn
yarn run build
echo "--------------------"
echo "add '?version=1' in css file"
vi /build/index.html
echo "--------------------"
echo "Website is running"
echo "********************"
