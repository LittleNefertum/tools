for i in 1.25.{0..1} ;do echo downloading kubectl $i;mkdir -p $HOME/kubectl/v$i;curl -o $HOME/kubectl/v$i/kubectl -sLOC - https://dl.k8s.io/release/v$i/bin/linux/amd64/kubectl; echo downloading kubectl.sha256 for kubectl $i;curl -o $HOME/kubectl/v$i/kubectl.sha256 -sLO https://dl.k8s.io/release/v$i/bin/linux/amd64/kubectl.sha256;done;
 
