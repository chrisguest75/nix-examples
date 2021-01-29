{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "bash";
  tag = "latest";
  config = {
    Cmd = [ "${pkgs.bash}/bin/bash" ];
  };
  created = "now";
  contents = [
      pkgs.bash
    ];  
}
