{ 
    pkgs ? import <nixpkgs> { system = builtins.currentSystem; },
    lib ? pkgs.lib,
    stdenv ? pkgs.stdenv,
    which ? pkgs.which,
    git ? pkgs.git,
    pkg-config ? pkgs.pkg-config,
    debianutils ? pkgs.debianutils,
    fetchgit ? pkgs.fetchgit
}:
stdenv.mkDerivation rec {
  pname = "svg2ass";
  version = "0.0.1";

  src = fetchgit {
    url = "https://github.com/irrwahn/svg2ass";
    rev = "98c96f218023960d39b743e31e729e941b2c1933";
    sha256 = "sha256-gv4l2QfeFp8OiSAJl8xB/jKR4TEk26YtQvXK4WykBQs=";
  };

  buildInputs = [
    which
    git
    pkg-config
    debianutils
  ];

  buildPhase = ''
    make D=0
  '';

  installPhase = ''
    mkdir -p $out/bin
    mv svg2ass $out/bin
  '';

  #outputs = [ "bin" ];

  installCheckPhase = "$out/bin/svg2ass";
  doInstallCheck = true;

  meta = with lib; {
    description = "svg2ass - Convert SVG vector graphics to ASS subtitle draw instructions";
    homepage = "https://github.com/irrwahn/svg2ass";
    license = lib.licenses.mit;
    mainProgram = "binary";
    platforms = lib.platforms.linux;
  };
}