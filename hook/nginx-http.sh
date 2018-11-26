#!/bin/sh
echo "********************"
rm -rf /etc/nginx/sites-enabled/default
rm -rf /etc/nginx/nginx.conf
cp storage/http/blog.conf /etc/nginx/sites-enabled/default
cp storage/nginx.conf /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
echo "--------------------"
echo "Done!"
echo "********************"
