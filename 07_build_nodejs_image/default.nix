{ pkgs ? import <nixpkgs> {} }:

# Ref: https://github.com/nix-community/docker-nixpkgs/blob/master/images/devcontainer/default.nix

pkgs.dockerTools.buildImage {
  name = "nixnode";
  tag = "latest";

  extraCommands = ''
      # setup shadow, bashrc
      #mkdir home
      #cp -r ${./root/etc} etc
      #chmod +w etc etc/group etc/passwd etc/shadow
  '';

  config = {
    Cmd = [ "${pkgs.bash}/bin/node" ];
    Env = [ 
      "NODE_ENV=production"
    ];
  };
  created = "now";
  contents = [
      #pkgs.glibc
      pkgs.shadow
      pkgs.bash
      pkgs.coreutils
      pkgs.nodejs
    ];  
}
