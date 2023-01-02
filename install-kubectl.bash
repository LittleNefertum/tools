#!/bin/bash
rm $HOME/kubectl/kubectl-aliases
# for i in 1.19.{0..16} 1.20.{0..15} 1.21.{0..14} 1.22.{0..17} 1.23.{0..15} 1.24.{0..9} 1.25.{0..5} 1.26.0;do echo downloading kubectl $i;mkdir -p $HOME/kubectl/v$i;curl -o $HOME/kubectl/v$i/kubectl -sLOC - https://dl.k8s.io/release/v$i/bin/linux/amd64/kubectl; echo downloading kubectl.sha256 for kubectl $i;curl -o $HOME/kubectl/v$i/kubectl.sha256 -sLO https://dl.k8s.io/release/v$i/bin/linux/amd64/kubectl.sha256;done;
# for i in 1.19.{0..16} 1.20.{0..15} 1.21.{0..14} 1.22.{0..17} 1.23.{0..15} 1.24.{0..9} 1.25.{0..5} 1.26.0;do echo "$(cat $HOME/kubectl/v$i/kubectl.sha256)  $HOME/kubectl/v$i/kubectl" | sha256sum --check;done;
# for i in 1.19.{0..16} 1.20.{0..15} 1.21.{0..14} 1.22.{0..17} 1.23.{0..15} 1.24.{0..9} 1.25.{0..5} 1.26.0;do chmod +x "$HOME/kubectl/v$i/kubectl";done;
# mkdir -p $HOME/.local/bin
for i in 1.19.{0..16} 1.20.{0..15} 1.21.{0..14} 1.22.{0..17} 1.23.{0..15} 1.24.{0..9} 1.25.{0..5} 1.26.0; do
  echo downloading kubectl $i
  mkdir -p $HOME/kubectl/v$i
  curl -o $HOME/kubectl/v$i/kubectl -sLOC - https://dl.k8s.io/release/v$i/bin/linux/amd64/kubectl
  echo downloading kubectl.sha256 for kubectl $i
  curl -o $HOME/kubectl/v$i/kubectl.sha256 -sLO https://dl.k8s.io/release/v$i/bin/linux/amd64/kubectl.sha256
  if [ $(echo "$(cat $HOME/kubectl/v$i/kubectl.sha256)  $HOME/kubectl/v$i/kubectl" | sha256sum --check | cut -d ' ' -f 2) == "OK" ]; then
    chmod +x "$HOME/kubectl/v$i/kubectl"
    echo alias "kubectl-v$i=$HOME/kubectl/v$i/kubectl" >> $HOME/kubectl/kubectl-aliases
   else
    echo "sha256 checksum issue with $HOME/kubectl/v$i/kubectl"
  fi
done
source $HOME/kubectl/kubectl-aliases
alias kubectl=kubectl-v$i
echo "******** kubectl aliases ************" >> $HOME/.bashrc
echo "source $HOME/kubectl/kubectl-aliases" >> $HOME/.bashrc
