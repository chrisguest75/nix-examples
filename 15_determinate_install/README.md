# NIX_INSTALLER

Demonstrate how to use the Determinate Systems Installer.  

## Build

```sh
# build
docker build -f Dockerfile -t determinant .

# run
docker run -it --rm determinant
```

## Examples

```sh
nix-env -f. -iA jq -vvv
#nix-build jq.nix
jq --version

cd ./multitool
nix develop --impure 
```

## Resources

* DeterminateSystems/nix-installer [here](https://github.com/DeterminateSystems/nix-installer)  