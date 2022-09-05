with import <nixpkgs> {};

buildEnv {
  name = "buildsox";
  paths = [ sox ];
}