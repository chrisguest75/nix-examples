{ 
    pkgs ? import <nixpkgs> { system = builtins.currentSystem; },
    lib ? pkgs.lib,
    stdenv ? pkgs.stdenv,
    git ? pkgs.git,
    fetchgit ? pkgs.fetchgit
}:
stdenv.mkDerivation rec {
  pname = "swissfileknife";
  version = "2.0.0";

  src = fetchgit {
    url = "https://github.com/sfktools/swissfileknife";
    rev = "50bbdede80f96ab7cd14d179a8035692842ea04b";
    sha256 = "sha256-f9fbhli39b3lr8u4DVkuQx32KVW7gUUVen3/6K+Lclc=";
  };

  buildInputs = [
    git
  ];

  buildPhase = ''
    ls -la
    g++ -Isrc -s src/sfk.cpp src/sfkext.cpp src/sfkpack.cpp -o sfk

  '';

  installPhase = ''
    mkdir -p $out/bin
    mv sfk $out/bin
  '';

  #outputs = [ "bin" ];

  installCheckPhase = ''
    ls -la  
    $out/bin/sfk || true
  '';
  doInstallCheck = true;

  meta = with lib; {
    description = "A multi function command line tool, providing 100 commands for search, replace, copy, transfer, convert of text and binary files, instant web server, ftp server and more.";
    homepage = "https://github.com/sfktools/swissfileknife";
    license = lib.licenses.bsd2;
    mainProgram = "binary";
    platforms = lib.platforms.linux;
  };
}