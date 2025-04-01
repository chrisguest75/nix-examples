# DOCKER

Troubleshooting and configuration information for Docker.  

TODO:

* Mount command is failing in my docker examples
* "containerd-snapshotter": true
* https://github.com/NixOS/nixpkgs/blob/f82e9b88c983b5fad78b35ec57985e9609c416b0/nixos/modules/system/boot/binfmt.nix  `cat /run/binfmt/aarch64-linux`
* Run an aarch64 process..... https://github.com/casey/just/releases

## Config in Nix

Look at available settings [here](https://search.nixos.org/options?channel=24.11&show=virtualisation.docker.daemon.settings&from=0&size=50&sort=alpha_asc&type=packages&query=virtualisation.docker)

* virtualisation.docker.enable = true;
* hardware.nvidia-container-toolkit.enable = true;

## View Docker Daemon Configuration

```sh
# find dockerd
ps -ax | grep docker

cat /nix/store/vw1nwy9plcq6jkz1mpf9ipz3nr3lbzdk-daemon.json
```

## Multiarch

Install the `qemu` package.  

## Resources

* https://nixos.wiki/wiki/Docker
* https://docs.docker.com/reference/cli/dockerd/#daemon-configuration-file
* https://docs.docker.com/engine/storage/containerd/
* https://medium.com/@furkan.turkal/how-does-docker-actually-work-the-hard-way-a-technical-deep-diving-c5b8ea2f0422
* What is a containerd snapshotter? [here](https://dev.to/napicella/what-is-a-containerd-snapshotters-3eo2)
* Investigate integration with Docker Engine / Desktop [here](https://github.com/pdtpartners/nix-snapshotter/issues/88)
