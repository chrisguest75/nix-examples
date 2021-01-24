{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "build-image";
  config = {
    Cmd = [ "${pkgs.hello}/bin/hello" ];
  };
}
