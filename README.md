# NixOS Configuration

## Introduction

> NixOS configuration files (`*.nix`) for my personal development and hobbyist enviorment.

## Code Samples



## Installation

> #### Download the `configuration.nix` file
```bash
curl https://raw.githubusercontent.com/yonderbread/nixos/master/configuration.nix > configuration.nix
```
> #### Move it into the `/etc/nixos` directory
```bash
# Make sure to keep a copy of your old config if you didn't already!
sudo cp configuration.nix /etc/nixos/configuration.nix
```
> #### Rebuild configuration and switch to it after boot
```bash
sudo nixos-rebuild boot -j`nproc`
sudo reboot # Apply the changes
```
