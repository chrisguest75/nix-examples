{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "kuttl";
  tag = "latest";
  config = {
    Cmd = [ "${pkgs.kubectl}/bin/kubectl" "kuttl" ];
  };
  created = "now";
  contents = [
      pkgs.curl
      pkgs.bash
      pkgs.git
      pkgs.openssh
      pkgs.openssl
      pkgs.kubernetes-helm
      pkgs.kubectl
    ];  
}

#krew
#pkgs.ca-certificates
#pkgs.openssh-client
#install kuttl


# RUN curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.tar.gz" && \ 

# tar zxvf krew.tar.gz && \ 

# KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_$(uname -m | sed -e 's/x86_64/amd64/' -e 's/arm.*$/arm/')" && \ 

# "$KREW" install krew 

# ENV PATH="/root/.krew/bin:$PATH" 

# RUN kubectl krew install kuttl 
