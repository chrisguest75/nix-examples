# SWISS FILE KNIFE

Swiss File Knife - A Command Line Tools Collection.

## Build

```sh
nix-build ./sfk.nix

# pkgs.callPackage
nix-build -E 'let pkgs = import <nixpkgs> { }; in pkgs.callPackage ./sfk.nix {}'

# use built binary
./result/bin/sfk
```

## Resources

* http://stahlworks.com/swiss-file-knife.html