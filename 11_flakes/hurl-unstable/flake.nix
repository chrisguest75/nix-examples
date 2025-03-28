# flake.nix
{
    description = "A flake for hurl";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    #       ↑ Swap it for your system if needed
    #       "aarch64-linux" / "x86_64-darwin" / "aarch64-darwin"
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {

      packages = [ 
          pkgs.hurl 
       ];

      env = {
      };

      shellHook = ''
        echo "***************************************************"
        echo "*** Welcome to hurl"
        echo "***************************************************"
        echo ""
        hurl --version
      '';       
    };
  };
}
