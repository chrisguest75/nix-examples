with import <nixpkgs> {};

buildEnv {
  name = "multitool";
  paths = [ 
    ffmpeg_5
    sox 
    gawk 
  ];
}

