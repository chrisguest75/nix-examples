# NIX PILLS

TODO:

* What is the difference between profiles and generations?  

NOTES:  

* In Nix, everything is an expression, there are no statements. This is common in functional languages.
* Values in Nix are immutable.

## Contents

- [NIX PILLS](#nix-pills)
  - [Contents](#contents)
  - [Pills](#pills)
  - [🏠 Build and Run](#-build-and-run)
  - [Chapter 2. Installation](#chapter-2-installation)
    - [Profiles](#profiles)
  - [Chapter 3. Enter the Environment](#chapter-3-enter-the-environment)
    - [Generations](#generations)
    - [Querying Store](#querying-store)
    - [Closures](#closures)
  - [Chapter 4. The Basics of the Language](#chapter-4-the-basics-of-the-language)
  - [Repl](#repl)
  - [Chapter 6. Our First Derivation](#chapter-6-our-first-derivation)
  - [Build](#build)
  - [Resources](#resources)

## Pills

Goto [nixos.org/guides/nix-pills](https://nixos.org/guides/nix-pills/)

## 🏠 Build and Run

```sh
# build nix
docker build -t nix-pills .

# debugging and host repo in build folder
docker run -v .:/build -it --entrypoint /bin/sh nix-pills
```

## Chapter 2. Installation

I've used [15_determinate_install/README.md](../15_determinate_install/README.md) to install.  

```sh
nix-env -iA sqlite -f '<nixpkgs>'

sqlite3 /nix/var/nix/db/db.sqlite

# this is read-only.....
.table

.quit
```

### Profiles

```sh
# shows symlink
ls -l ~/.nix-profile

# shows profile 
ls ~/.nix-profile
```

## Chapter 3. Enter the Environment

REF: [enter-environment](https://nixos.org/guides/nix-pills/enter-environment.html)  

### Generations

Shows a rollback.  

```sh
nix-env --list-generations

nix-channel --list
# update channels
nix-channel --update

# install hello and create new generation
nix-env -i hello

# run hello
hello

nix-env --list-generations

# rollback
nix-env --rollback

# cannot run hello
hello

nix-env --list-generations
```

### Querying Store

Query the store.  

```sh
nix-env -i hello

# package
nix-shell -p hello

# references
nix-store -q --references `which hello`

# referred by
nix-store -q --referrers `which hello`

# packages
nix-shell -p python311Full python311Packages.pip pipenv

# references
nix-store -q --references `which pipenv`

# referred by
nix-store -q --referrers `which pipenv`
```

### Closures

```sh
nix-store -qR `which pipenv`

nix-store -q --tree `which pipenv`

nix-store -q --tree ~/.nix-profile
```

## Chapter 4. The Basics of the Language

REF: [basics-of-language](https://nixos.org/guides/nix-pills/basics-of-language)  

## Repl

```sh
nix repl

1+3 
6/ 2

if 10 > 4 then "yes" else "no"


:help
The following commands are available:

  <expr>        Evaluate and print expression
  <x> = <expr>  Bind expression to variable
  :a <expr>     Add attributes from resulting set to scope
  :b <expr>     Build a derivation
  :bl <expr>    Build a derivation, creating GC roots in the working directory
  :e <expr>     Open package or function in $EDITOR
  :i <expr>     Build derivation, then install result into current profile
  :l <path>     Load Nix expression and add it to scope
  :lf <ref>     Load Nix flake and add it to scope
  :p <expr>     Evaluate and print expression recursively
  :q            Exit nix-repl
  :r            Reload all files
  :sh <expr>    Build dependencies of derivation, then start nix-shell
  :t <expr>     Describe result of evaluation
  :u <expr>     Build derivation, then start nix-shell
  :doc <expr>   Show documentation of a builtin function
  :log <expr>   Show logs for a derivation
  :te [bool]    Enable, disable or toggle showing traces for errors

:quit
```

## Chapter 6. Our First Derivation

REF: [our-first-derivation](https://nixos.org/guides/nix-pills/our-first-derivation.html)  

## Build

```sh
d = derivation { name = "myname"; builder = "mybuilder"; system = builtins.currentSystem; } 

:b d
```

## Resources

* Nix Pills [here](https://nixos.org/guides/nix-pills)

https://nixos.wiki/wiki/Cheatsheet

https://nixos.org/manual/nix/stable/language/builtins.html
 
https://nixos.org/guides/nix-pills/enter-environment.html
