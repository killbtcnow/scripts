#!/bin/sh
echo "********************"
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo "--------------------"
free -h
echo "********************"
