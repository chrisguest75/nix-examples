{
  pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/4fe8d07066f6ea82cda2b0c9ae7aee59b2d241b3.tar.gz";
    sha256 = "sha256:06jzngg5jm1f81sc4xfskvvgjy5bblz51xpl788mnps1wrkykfhp";
  }) {}
}:
pkgs.stdenv.mkDerivation rec {
  pname = "pngtopi1";
  version = "1.2.0";

  src = pkgs.fetchgit {
    url = "https://github.com/benjihan/pngtopi1";
    rev = "acfc127986b3f5a49257e9a5eb3f84b88c8186fe";
    sha256 = "sha256-35NP0tIQuY1UqchTSmOPrU3mPE2gqJBojYyTXDWccdI=";

  };

  buildInputs = [
    pkgs.which
    pkgs.git
    pkgs.pkg-config
    pkgs.libpng
  ];

  buildPhase = ''
    make D=0
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv pngtopi1 $out/bin
  '';
}