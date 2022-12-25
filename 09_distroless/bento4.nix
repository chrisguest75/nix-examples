with import <nixpkgs> {};

buildEnv {
  name = "buildbento4";
  paths = [ 
    bento4 
    gawk 
  ];
}