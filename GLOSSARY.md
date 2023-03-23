# GLOSSARY

## Derivation

A Nix derivation is a key concept in the Nix package manager and the NixOS operating system. Nix is a functional package management system designed to ensure consistent, reproducible, and isolated build environments for software packages. It treats packages as values in a functional programming language.  

A derivation is a core building block in Nix, representing a build action that produces one or more output paths. It is essentially a pure function that takes a set of inputs (dependencies, source code, build scripts, etc.) and produces a set of outputs (usually one or more packages). Each output has a unique hash, which is derived from the inputs, making the build process deterministic and reproducible.  

Derivations are usually written in the Nix expression language (also called Nix language or simply Nix). This language is a lazy, functional programming language specifically designed for Nix package definitions and configurations.  

Nix derivations have several benefits, including:  

Reproducible builds: Since the output hash depends on the inputs, any change in the inputs will result in a different output hash. This guarantees that the same inputs will always produce the same output.

Isolation: Derivations are built in isolated environments, ensuring that there are no hidden dependencies or side effects from the build process.  

Rollbacks and multiple versions: Due to the unique hashes for each build, Nix allows you to have multiple versions of the same package installed concurrently, and it's easy to rollback to a previous version if needed.  

In summary, a Nix derivation is a fundamental concept in the Nix package manager that represents a build action. It ensures that the build process is reproducible, deterministic, and isolated, which leads to more reliable and manageable software systems.  

## Channel

A channel in Nix is a collection of package definitions and configurations that are curated and maintained together. Channels serve as an easy way for users to obtain and manage software packages, as well as to stay up-to-date with the latest versions of the packages they use. Channels are versioned and can be updated or rolled back as needed, which provides users with greater flexibility and control over their software environment.  

Nix channels are typically hosted on remote servers and are periodically updated by their maintainers. When a user wants to install or update a package, Nix will fetch the latest version of the package and its dependencies from the appropriate channel.  

There are several official Nix channels, such as:

* nixpkgs: This is the main channel for Nix packages, containing a vast collection of software for various Unix-based systems. It includes both open-source and proprietary software, as well as libraries, tools, and frameworks. The nixpkgs channel is frequently updated and provides a solid base for most users.  

* nixos: This channel is specifically tailored for NixOS users and contains the NixOS operating system configuration, as well as package definitions. The nixos channel is tightly integrated with nixpkgs and is updated alongside it.  

Users can also create and use custom channels, which can be particularly useful for organizations or development teams that want to maintain a curated set of packages and configurations specific to their needs.  

To manage channels, Nix provides the nix-channel command-line utility, which allows users to add, update, list, and remove channels. When a user updates their channels, Nix will fetch the latest package definitions and configurations, making them available for installation or updates.  

## Pure

In Nix, "pure" refers to the concept of purity of a function or expression. A pure function or expression is one that has no side effects and returns the same result every time it is called with the same arguments. This means that a pure function does not depend on any mutable state outside of its own scope and has no observable effects on the program's state.  

In contrast, an "impure" function or expression may have side effects, such as modifying global state, reading or writing files, or communicating with external systems. An impure function may return different results for the same inputs or have observable effects on the program's state.  

In the context of Nix, purity is an important concept because it allows for reliable and predictable behavior of the Nix package manager and build system. By ensuring that all expressions used in Nix are pure, it is possible to guarantee that the results of a build will be reproducible across different machines and at different times, regardless of the context in which the build is run. This makes it easier to share and distribute packages, and reduces the likelihood of unexpected errors or inconsistencies in the build process.  
