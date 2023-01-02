#!/bin/bash
echo "Bash version ${BASH_VERSION}..."
for i in 1.19.{0..16} 1.20.{0..15} 1.21.{0..14} 1.22.{0..17} 1.23.{0..16} 1.24.{0..9} 1.25.{0..5} 1.26.0;do echo downloading kubectl $i;mkdir -p $HOME/kubectl/v$i;curl -o $HOME/kubectl/v$i/kubectl -sLOC - https://dl.k8s.io/release/v$i/bin/linux/amd64/kubectl; echo downloading kubectl.sha256 for kubectl $i;curl -o $HOME/kubectl/v$i/kubectl.sha256 -sLO https://dl.k8s.io/release/v$i/bin/linux/amd64/kubectl.sha256;done;
for i in 1.19.{0..16} 1.20.{0..15} 1.21.{0..14} 1.22.{0..17} 1.23.{0..16} 1.24.{0..9} 1.25.{0..5} 1.26.0;do echo "$(cat $HOME/kubectl/$i/kubectl.sha256)  $HOME/kubectl/$i/kubectl" | sha256sum --check;done;
for i in 1.19.{0..16} 1.20.{0..15} 1.21.{0..14} 1.22.{0..17} 1.23.{0..16} 1.24.{0..9} 1.25.{0..5} 1.26.0;do chmod +x kubectl;done;
