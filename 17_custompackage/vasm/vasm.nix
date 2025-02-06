{ 
    pkgs ? import <nixpkgs> { system = builtins.currentSystem; },
    lib ? pkgs.lib,
    stdenv ? pkgs.stdenv,
    git ? pkgs.git,
    fetchgit ? pkgs.fetchgit,
    cmake ? pkgs.cmake,
}:
stdenv.mkDerivation rec {
  pname = "vasm";
  version = "2.0a";

  src = fetchgit {
    url = "https://github.com/StarWolf3000/vasm-mirror";
    rev = "d14dda1513a6adac54ac43fc468d94bf2ba05d0e";
    sha256 = "sha256-iwbk/G03RhfdihjS+ptKd3Bwgk+MQuvkQq3739fT3J8=";
  };

  buildInputs = [
    git
    cmake
  ];

  buildPhase = ''
    ls -a
    mkdir build
    cd build
    cmake -DVASM_CPU=m68k -DVASM_SYNTAX=mot ..
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv vasm $out/bin
  '';

  #outputs = [ "bin" ];

  installCheckPhase = ''
    ls -la  
    $out/bin/vasm --help
  '';
  doInstallCheck = true;

  meta = with lib; {
    description = " A portable and retargetable assembler";
    homepage = "https://github.com/StarWolf3000/vasm-mirror";
    license = lib.licenses.bsd2;
    mainProgram = "binary";
    platforms = lib.platforms.linux;
  };
}