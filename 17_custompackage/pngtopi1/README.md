# PNGTOPI1

pngtopi1 - PNG/Degas image file converter

## Build

```sh
# nix-build
nix-build ./pngtopi1.nix

# pkgs.callPackage
nix-build -E 'let pkgs = import <nixpkgs> { }; in pkgs.callPackage ./pngtopi1.nix {}'

# use built binary
./result/bin/pngtopi1
```

## Resources

* benjihan/pngtopi1 repo [here](https://github.com/benjihan/pngtopi1)
* Hacking Your First Package [here](https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial/first-package.html#a-first-nix-package-definitionnix)
* I don't understand why I have " cannot evaluate a function that has an argument without a value ('fetchurl') " when I try to build a package [here](https://stackoverflow.com/questions/74658457/i-dont-understand-why-i-have-cannot-evaluate-a-function-that-has-an-argument)
