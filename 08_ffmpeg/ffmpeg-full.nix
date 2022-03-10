{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "ffmpeg";
  tag = "latest";

  created = "now";
  contents = [
      pkgs.ffmpeg-full
    ];  
}
