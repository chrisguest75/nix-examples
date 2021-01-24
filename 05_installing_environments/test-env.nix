{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "test-env";
      paths = [
        coreutils
        gdb
        jq
      ];
    };
  };
}