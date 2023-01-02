#!/bin/bash
mkdir -p "$HOME/Downloads"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$HOME/Downloads/awscliv2.zip"
unzip "$HOME/Downloads/awscliv2.zip" -d "$HOME/Downloads"
rm "$HOME/Downloads/awscliv2.zip"
sudo "$HOME/Downloads/aws/install"
