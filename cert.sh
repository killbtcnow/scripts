#!/bin/sh
echo "********************
"echo "allow all path"
rm -rf /etc/nginx/sites-enabled/default
cp storage/http/allow.conf /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx
echo "--------------------"
echo "set certbot"
sudo certbot certonly --webroot --webroot-path=/var/www/html -d www.lazts.com
sudo ls -l /etc/letsencrypt/live/lazts.com
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
echo "--------------------"
echo "set nginx"
cp storage/snippets/ssl-lazts.com.conf /etc/nginx/snippets/ssl-lazts.com.conf
cp storage/snippets/ssl-params.conf /etc/nginx/snippets/ssl-params.conf
rm -rf /etc/nginx/sites-enabled/default
cp storage/https/blog.conf /etc/nginx/sites-enabled/default
echo "--------------------"
echo "set firewall"
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
sudo ufw status
sudo nginx -t
sudo systemctl restart nginx
echo "--------------------"
echo "Set Up Auto Renewal"
echo "Put here in end of file:"
echo "13 5 * * * /usr/bin/certbot renew --quiet --renew-hook \"/bin/systemctl reload nginx\""
sudo crontab -e
echo "********************"
