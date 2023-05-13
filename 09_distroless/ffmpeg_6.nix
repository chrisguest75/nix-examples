{ pkgs ? import <nixpkgs> {} }:

let
  unstablePkgs = import <nixos-unstable> {};

in pkgs.buildEnv {
  name = "ffmpegbuild";

  paths = [
    unstablePkgs.ffmpeg_6
    pkgs.gawk
  ];
}



