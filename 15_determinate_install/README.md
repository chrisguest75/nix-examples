# NIX_INSTALLER

Demonstrate how to use the Determinate Systems Installer.  

## Install

### WSL

SystemD is recommended [github.com/chrisguest75/sysadmin_examples/34_WSL/SYSTEMD.md](https://github.com/chrisguest75/sysadmin_examples/blob/master/34_WSL/SYSTEMD.md)  

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## Build Docker

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
