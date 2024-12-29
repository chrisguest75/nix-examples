# GPU

Notes on GPU on Nix.

NOTES:

* The legacy 390 drivers for nvidia do not install.

## Install

Example of installing drivers for nvidia GPU [26_home_manager_machines/nix5530/nixos/nvidia.nix](../26_home_manager_machines/nix5530/nixos/nvidia.nix)

## Monitoring

Taken from [26_home_manager_machines/nix5530/justfile](../26_home_manager_machines/nix5530/justfile)

```sh
just monitor-gpu
```

## Testing

To test GPU use [chrisguest75/docker_examples/blob/master/A2_gpu/README.md](https://github.com/chrisguest75/docker_examples/blob/master/A2_gpu/README.md)  

## Resources

