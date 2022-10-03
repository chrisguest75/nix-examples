with import <nixpkgs> {};

buildEnv {
  name = "multitool";
  paths = [ 
    ffmpeg-full 
    sox 
    gawk 
  ];
}

