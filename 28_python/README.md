# PYTHON PACKAGE MANAGERS

Create an environment to run a python3 application.  

REF: [github.com/chrisguest75/python_examples/22_nix/README.md](https://github.com/chrisguest75/python_examples/blob/main/22_nix/README.md)  

NOTES:

* The flake file has to be in the git index (committed or staged) before you can enter develop.
* Packages like `numpy` use precompiled binaries.  

TODO:

* git
* code
* bashrc or zshrc

## Prereqs

Install Nix using determinate systems installer.  

REF: [github.com/chrisguest75/nix-examples/15_determinate_install/README.md](https://github.com/chrisguest75/nix-examples/blob/master/15_determinate_install/README.md)  

```sh
# check flakes are enabled
cat /etc/nix/nix.conf 
```

## Development (pure)

Open a pure shell and install packages

### Pipenv

REF: [pipenv_pure/README.md](./pipenv_pure/README.md)

### Poetry

REF: [poetry_pure/README.md](./poetry_pure/README.md)

## Development (flake)

Open a flake and install packages

REF: [pipenv_flake/README.md](./pipenv_flake/README.md)

## Resources

* Nix Manual - Python [here](https://nixos.org/manual/nixpkgs/stable/#python)
* Search more than 80 000 packages [here](https://search.nixos.org/)