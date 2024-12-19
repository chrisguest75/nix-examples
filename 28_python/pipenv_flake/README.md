# SIMPLE CLI SKELETON

Demonstrate a simple skeleton that other projects can be based on.  

Demonstrates:

* flake8 linting
* logging
* argument parsing
* docstrings

NOTES:

* `numpy` installs precompiled binaries that link to glib expecting FHS compliant filesystem. We have to use `nix-ld` to map the paths from `nix-store`.  
* We map `NIX_LD_LIBRARY_PATH` to `LD_LIBRARY_PATH`.  

## Development using nix

Open a pure shell and install packages

```sh
nix flake show templates

nix flake new pipenv_flake

# enter folder 
cd ./pipenv_flake

nix build 

nix flake metadata

nix flake check

nix develop --impure --command bash -c 'python --version'

# enter the flake - we have to use impure for nix-ld
nix develop --impure

zsh

# numpy will fail
just start
strace -f just start 2>&1 | grep libstd

env | sort | grep NIX_
```

## Start

```sh
# this is now in the flake
export PIPENV_VENV_IN_PROJECT=1
# install
pipenv install --dev

# see the packages inside the venv
pipenv run pip list

# create .env file
cp .env.template .env
. ./.env

# lint and test code
pipenv run lint
pipenv run test

# enter venv
pipenv shell

# run with arguments
pipenv run start --test
pipenv run start:test 
```

## Debugging and Troubleshooting

```sh
# enter python
pipenv run python

> import main

> main.test.__doc__
```

## Created

```sh
# install
pipenv install --dev flake8 flake8-bugbear flake8-2020 black
pipenv install --dev pytest 
pipenv install pyyaml python-json-logger python-dotenv
```

## Resources

* Flakes Output Schema [here](https://nixos.wiki/wiki/Flakes#Output_schema)
* Development workflow with Nix [here](https://ayats.org/blog/nix-workflow/)
* Locally excluding nix flakes when using nix independenly of upstream [here](https://discourse.nixos.org/t/locally-excluding-nix-flakes-when-using-nix-independenly-of-upstream/16480)
* Poetry2Nix - can not get a flake to work  https://www.reddit.com/r/NixOS/comments/16cfdag/poetry2nix_can_not_get_a_flake_to_work/?rdt=48743
* https://github.com/mcdonc/.nixconfig/blob/e7885ad18b7980f221e59a21c91b8eb02795b541/videos/pydev/script.rst
* https://github.com/nix-community/nix-ld
* Nix-ld: A clean solution for issues with pre-compiled executables on NixOS [here](https://blog.thalheim.io/2022/12/31/nix-ld-a-clean-solution-for-issues-with-pre-compiled-executables-on-nixos/)
* Python development environments with Nix [here](https://wiki.nixos.org/wiki/Python#Running_compiled_libraries)
* https://github.com/GuillaumeDesforges/fix-python/