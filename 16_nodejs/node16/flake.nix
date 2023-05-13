{
  description = "Install ffmpeg as a flake";
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs-node.url = "github:nixos/nixpkgs/8ad5e8132c5dcf977e308e7bf5517cc6cc0bf7d8";

  outputs = { nixpkgs, flake-utils, nixpkgs-node, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ 
            (import nixpkgs-node { inherit system; }).nodejs-16_x 
          ];         
        };
      });
}
