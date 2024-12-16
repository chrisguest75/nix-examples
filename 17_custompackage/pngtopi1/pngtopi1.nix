{ 
    pkgs ? import <nixpkgs> { system = builtins.currentSystem; },
    lib ? pkgs.lib,
    stdenv ? pkgs.stdenv,
    which ? pkgs.which,
    git ? pkgs.git,
    pkg-config ? pkgs.pkg-config,
    libpng ? pkgs.libpng,
    fetchgit ? pkgs.fetchgit
}:
stdenv.mkDerivation rec {
  pname = "pngtopi1";
  version = "1.2.0";

  src = fetchgit {
    url = "https://github.com/benjihan/pngtopi1";
    rev = "acfc127986b3f5a49257e9a5eb3f84b88c8186fe";
    sha256 = "sha256-35NP0tIQuY1UqchTSmOPrU3mPE2gqJBojYyTXDWccdI=";
  };

  buildInputs = [
    which
    git
    pkg-config
    libpng
  ];

  buildPhase = ''
    make D=0
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv pngtopi1 $out/bin
  '';

  #outputs = [ "bin" ];

  installCheckPhase = "$out/bin/pngtopi1 --help";
  doInstallCheck = true;

  meta = with lib; {
    description = "pngtopi1 - PNG/Degas image file converter";
    homepage = "https://github.com/benjihan/pngtopi1";
    license = lib.licenses.mit;
    mainProgram = "binary";
    platforms = lib.platforms.linux;
  };
}