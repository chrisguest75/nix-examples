{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "simple-c-app";
  version = "1.0.0";

  src = ./.; # Use the current directory as the source

  buildInputs = [ 
    pkgs.gcc
    pkgs.gnumake 
    ];

  buildPhase = ''
    make -f makefile.gcc
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp helloworld $out/bin/
  '';

  meta = with pkgs.lib; {
    description = "A simple C application packaged with Nix";
    license = licenses.mit;
  };
}

