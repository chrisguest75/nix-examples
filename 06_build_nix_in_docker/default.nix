{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "bash";
  tag = "latest";
  config = {
    Cmd = [ "${pkgs.bash}/bin/bash" ];
    Env = [
      "SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt"
    ];
  };
  created = "now";
  contents = [
      pkgs.cacert
      pkgs.bash
      pkgs.curl
    ];  
}
