#!/bin/bash
sudo apt update
echo "***********************"
echo "*** Installing curl ***"
echo "***********************"
sudo apt install curl
echo "******************************"
echo "*** Installing zip & unzip ***"
echo "******************************"
sudo apt install zip
sudo apt install unzip
echo "***********************"
echo "*** Installing curl ***"
echo "***********************"
sudo apt install zip
echo "******************************"
echo $(pwd)
echo "******************************"
source $(pwd)/awscliv2/setup.bash
# source $(pwd)/install-kubectl.bash
