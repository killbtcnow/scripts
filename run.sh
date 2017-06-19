#!/bin/sh
echo "********************"
cd /var/www/blog
rm -rf build
rm -rf node_modules
yarn
yarn run build
cd ../html
rm -rf node_modules
yarn

echo "--------------------"
echo "********************"
