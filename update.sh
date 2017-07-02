#!/bin/sh
echo "********************"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

npm update --global yarn
npm upgrade --global yarn

sudo apt-get autoremove

echo "--------------------"
echo "Done!"
echo "********************"
