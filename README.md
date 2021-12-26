# NixOS Configuration

[![Linux](https://svgshare.com/i/Zhy.svg)](https://nixos.org/guides/install-nix.html)
[![GitHub commits](https://badgen.net/github/commits/yonderbread/nixos)](https://GitHub.com/yonderbread/nixos/commit/)
[![Unlicense](https://img.shields.io/badge/License-Unlicense-blue.svg)](https://unlicense.org/)

## Introduction
>
[NixOS](https://nixos.org/) configuration files (`*.nix`) for my personal development and hobbyist enviorment. Intended for use on a Linux-based operating system.
>
## Installation
>
#### Download the `configuration.nix` file
```bash
curl https://raw.githubusercontent.com/yonderbread/nixos/master/configuration.nix > configuration.nix
```
#### Move it into the `/etc/nixos` directory
```bash
# Make sure to keep a copy of your old config if you didn't already!
sudo cp configuration.nix /etc/nixos/configuration.nix
```
#### Rebuild configuration and switch to it after boot
```bash
sudo nixos-rebuild boot -j`nproc`
sudo reboot # Apply the changes
```
