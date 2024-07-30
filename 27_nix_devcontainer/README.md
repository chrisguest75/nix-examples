# README

Demonstrate building a devcontainer with nix.  

REF: [nix-examples](https://github.com/chrisguest75/nix-examples)  
REF: [15_determinate_install](../15_determinate_install/README.md)  

## Start (vscode)

Use the Remote Containers extension and select "Reopen in Container" or...  

## Examples

```sh
nix-env -f. -iA jq -vvv
#nix-build jq.nix
jq --version
```

### Flakes

NOTE: Make sure that the repository is visible in the explorer view (it might be marked unsafe).  

```sh
cd ./multitool
nix develop --impure 
```

## Resources

* DeterminateSystems/nix-installer [here](https://github.com/DeterminateSystems/nix-installer)  
