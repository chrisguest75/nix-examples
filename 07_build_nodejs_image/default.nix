{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "nixnode";
  tag = "latest";
  config = {
    Cmd = [ "${pkgs.bash}/bin/node" ];
  };
  created = "now";
  contents = [
      pkgs.bash
      pkgs.coreutils
      pkgs.nodejs
    ];  
}
