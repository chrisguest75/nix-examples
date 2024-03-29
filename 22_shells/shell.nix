{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/06278c77b5d162e62df170fec307e83f1812d94b.tar.gz") {} }:

pkgs.mkShell {
  name = "my-test-shell";

  buildInputs = [
    pkgs.which
    pkgs.htop
    pkgs.zlib
  ];

  MY_ENVIRONMENT_VARIABLE = "world";  

  shellHook = ''
    echo "***************************************************"
    echo "*** Hello!"
    echo "***************************************************"
  '';
}

