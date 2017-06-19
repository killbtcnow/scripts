#!/bin/sh
echo "********************"
cd ~
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install certbot nginx -y

sudo cp -f /etc/nginx/sites-available/default /etc/nginx/sites-available/default.0.bak

sudo apt-get purge nodejs=legacy
wget https://nodejs.org/dist/v6.11.0/node-v6.11.0-linux-x64.tar.gz
mkdir node
tar xvf node-v*.tar.?z --strip-components=1 -C ./node
cd ~
rm -rf node-v*
mkdir node/etc
echo 'prefix=/usr/local' > node/etc/npmrc
sudo mv node /opt/
sudo chown -R root: /opt/node
sudo ln -s /opt/node/bin/node /usr/local/bin/node
sudo ln -s /opt/node/bin/npm /usr/local/bin/npm
sudo apt-get autoremove

export PATH=$PATH:/usr/local/bin

npm install yarn -g
yarn global add serve pm2
echo "--------------------"
node -v
echo "********************"
