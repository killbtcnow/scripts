#!/bin/sh
echo "********************"
cd ~
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install nginx -y

apt-get purge nodejs=legacy
wget https://nodejs.org/dist/v6.11.0/node-v6.11.0-linux-x64.tar.gz
mkdir node
tar xvf node-v*.tar.?z --strip-components=1 -C ./node
cd ~
rm -rf node-v*
mkdir node/etc
echo 'prefix=/user/local' > node/etc/npmrc
sudo mv node /opt/
sudo chown -R root: /opt/node
sudo ln -s /opt/node/bin/node /usr/local/bin/node
sudo ln -s /opt/node/bin/npm /usr/local/bin/npm
apt-get autoremove

export PATH=$PATH:/usr/local/bin

npm install yarn -g
yarn global add serve pm2
echo "--------------------"
node -v
echo "********************"
