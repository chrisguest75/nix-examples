{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs = { nixpkgs, ... }:
    let
      system = builtins.currentSystem;
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ pkgs.cowsay ];
      };
    };
}
