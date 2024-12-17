# POETRY

*Dependency Management*: Poetry has a more robust and faster dependency resolver and uses a single pyproject.toml file for both dependencies and package configuration. Pipenv, known for being a bit slower in resolving complex dependencies, manages dependencies through Pipfile and Pipfile.lock.  

*Package Publishing*: Poetry supports package building and publishing directly, making it suitable for developers who distribute packages. Pipenv focuses more on application development without native package publishing capabilities.  

*Performance*: Users generally find Poetry to offer better performance, particularly with dependency resolution, compared to Pipenv, which can be slower, especially for larger projects.  

*Lock Files*: Both use lock files (poetry.lock for Poetry and Pipfile.lock for Pipenv) to ensure dependency consistency across environments.  

*User Experience*: Poetry is praised for its simplicity and unified approach to project management and package publishing. Pipenv is user-friendly, particularly for those accustomed to pip and virtualenv, but some find its dual-file approach less convenient.  

*Community and Adoption*: Poetry is rapidly gaining popularity, especially among package maintainers, for its comprehensive toolset. Pipenv, endorsed by the Python Packaging Authority (PyPA), remains popular for application development, despite facing competition from Poetry.  

Demonstrates:

- flake8 linting
- logging
- argument parsing
- docstrings

NOTES:

- Check with pyenv that the version is installed. `pyenv install` 
- Look in the `poetry.toml` for settings
- `prefer-active-python` means we can use the current version of python.  
- With a .python_version pyenv will automatically switch directories.  

## Development using nix

Open a pure shell and install packages

```sh
cd ./poetry_pure
# python311 pure
nix-shell --pure -p python311Full python311Packages.pip poetry
```

## Start

```sh
# install
poetry install

# create .env file
cp .env.template .env
. ./.env

# run without entering venv
poetry run python main.py --test

# enter venv
poetry shell

# run with arguments
python ./main.py --test

# run simple test
pytest

# linting
flake8
```

## Debugging and Troubleshooting

```sh
# print out all the versions
poetry debug info 

# enter python
poetry run python

> import main

> main.test.__doc__
```

## Created

```sh
# install
poetry init
poetry config --local virtualenvs.create true
poetry config --local virtualenvs.in-project true

poetry add --group dev flake8 flake8-bugbear flake8-2020 black
poetry add --group dev pytest
poetry add pyyaml python-json-logger python-dotenv

# set python version
echo "3.11.1" > .python-version
poetry env use python3.11
```

## Resources

- Poetry is a tool for dependency management and packaging in Python. [here](https://python-poetry.org/docs/)
- Build Command Line Tools with Python Poetry [here](https://dev.to/bowmanjd/build-command-line-tools-with-python-poetry-4mnc)
- I move from pipenv to poetry in 2023 - Am I right ? [here](https://dev.to/farcellier/i-migrate-to-poetry-in-2023-am-i-right--115)
- PyEnv & Poetry - BFFs [here](https://dev.to/mattcale/pyenv-poetry-bffs-20k6)

