#!/bin/sh
echo "********************"
cd /var/www/blog
rm -rf build
rm -rf node_modules
yarn
yarn run build

cd /var/www/html
rm -rf node_modules
yarn
pm2 start app.js --env production

echo "--------------------"
echo "********************"
