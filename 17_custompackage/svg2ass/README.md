# SVG2ASS

svg2ass - Convert SVG vector graphics to ASS subtitle draw instructions.

## Build

```sh
# nix-build
nix-build ./svg2ass.nix

# pkgs.callPackage
nix-build -E 'let pkgs = import <nixpkgs> { }; in pkgs.callPackage ./svg2ass.nix {}'

# test svg2ass
cat ./Webpack.svg | ./result/bin/svg2ass  
```

## Resources

- https://github.com/irrwahn/svg2ass?tab=readme-ov-file
