#!/bin/bash
echo "******************************"
echo "*** Installing zip & unzip ***"
echo "******************************"
sudo apt install zip
sudo apt install unzip
echo "******************************"
echo $(pwd)
echo "******************************"
source $(pwd)/awscliv2/setup.bash
