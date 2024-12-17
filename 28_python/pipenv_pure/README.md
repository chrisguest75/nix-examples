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
cd ./pipenv_pure
# python311 pure
nix-shell --pure -p python311Full python311Packages.pip pipenv
```

## Start

```sh
export PIPENV_VENV_IN_PROJECT=1
# install
pipenv install --dev

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

* Stylising your Python code: An introduction to linting and formatting [here](https://www.jumpingrivers.com/blog/python-linting-guide/)
* Hypermodern Python 3: Linting [here](https://medium.com/@cjolowicz/hypermodern-python-3-linting-e2f15708da80)  
* DmytroLitvinov/awesome-flake8-extensions [here](https://github.com/DmytroLitvinov/awesome-flake8-extensions)  
* Python Linter Comparison 2022: Pylint vs Pyflakes vs Flake8 vs autopep8 vs Bandit vs Prospector vs Pylama vs Pyroma vs Black vs Mypy vs Radon vs mccabe [here](https://inventwithpython.com/blog/2022/11/19/python-linter-comparison-2022-pylint-vs-pyflakes-vs-flake8-vs-autopep8-vs-bandit-vs-prospector-vs-pylama-vs-pyroma-vs-black-vs-mypy-vs-radon-vs-mccabe/)  
* Flake8: Your Tool For Style Guide Enforcement [here](https://pypi.org/project/flake8/)  
* Workspace recommended extensions [here](https://code.visualstudio.com/docs/editor/extension-marketplace#_workspace-recommended-extensions)  
* Argparse vs Click [here](https://collectiveacuity.medium.com/argparse-vs-click-227f53f023dc)
* Writing pytest tests against tools written with argparse [here](https://til.simonwillison.net/pytest/pytest-argparse)
* Python Docstrings [here](https://www.programiz.com/python-programming/docstrings)  
