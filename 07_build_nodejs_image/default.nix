{ pkgs ? import <nixpkgs> {} }:

# Ref: https://github.com/nix-community/docker-nixpkgs/blob/master/images/devcontainer/default.nix

pkgs.dockerTools.buildImage {
  name = "nixnode";
  tag = "latest";

  extraCommands = ''
  '';

  config = {
    Cmd = [ "${pkgs.bash}/bin/node" ];
    Env = [ 
      "NODE_ENV=production"
    ];
  };
  created = "now";
  contents = [
      pkgs.bash
      #pkgs.coreutils
      pkgs.nodejs
    ];  
}
