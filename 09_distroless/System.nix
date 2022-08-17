with import <nixpkgs> {};

buildEnv {
  name = "System";
  paths = [ tmux fish coreutils ];
}