# flake.nix
{
    description = "A flake for developing with python 3.11.8";
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
          pkgs.python311Full 
          pkgs.python311Packages.pip 
          pkgs.pipenv 
       ];

      env = {
        PIPENV_VENV_IN_PROJECT=1;
      };

      shellHook = ''
        echo "***************************************************"
        echo "*** Welcome to python"
        echo "***************************************************"
        echo ""
        python --version
      '';       
    };
  };
}
