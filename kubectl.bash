#!/bin/bash
echo "Bash version ${BASH_VERSION}..."
for i in 1.22.{0..15} 1.23.{0..13} 1.24.{0..7} 1.25.{0..3};do echo downloading kubectl $i;mkdir -p ~/kubectl/$i;curl -o ~/kubectl/$i/kubectl -sLOC - https://dl.k8s.io/release/v1.25.0/bin/linux/amd64/kubectl; echo downloading kubectl.sha256 for kubectl $i;curl -o ~/kubectl/$i/kubectl.sha256 -sLO https://dl.k8s.io/release/v1.25.0/bin/linux/amd64/kubectl.sha256;done;
for i in 1.22.{0..15} 1.23.{0..13} 1.24.{0..7} 1.25.{0..3};do echo "$(cat $HOME/kubectl/$i/kubectl.sha256)  $HOME/kubectl/$i/kubectl" | sha256sum --check;done;
for i in 1.22.{0..15} 1.23.{0..13} 1.24.{0..7} 1.25.{0..3};do chmod +x kubectl;done;
