{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "kuttl";
  config = {
    Cmd = [ "${pkgs.kubectl}/bin/kubectl" "kuttl" ];
  };

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