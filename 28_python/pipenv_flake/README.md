# SIMPLE CLI SKELETON

Demonstrate a simple skeleton that other projects can be based on.  

Demonstrates:

* flake8 linting
* logging
* argument parsing
* docstrings

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

# enter the flake
nix develop
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