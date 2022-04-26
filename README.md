# opentrons-nix
How to setup a dev environment for Opentrons using nix

The `DEV_SETUP.md` for opentrons is quite complicated, with many manual steps, especially if someone only wants to work on part of opentrons. This repo shows you how to create a development environment with nix-shell as an alternative.

1. Install Nix (or use Nix docker)
    1. To use docker, install docker, then run `docker run -it -p 8080:8080 -v $(pwd)/:/workdir nixos/nix` from within the opentrons mono-repo
1. run `cd workdir` then `nix-shell`
1. use the file `shell.nix`

shell.nix is below
```nix
{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/715dc137b08213aabbbe0965b78ab938e5d8d3b7.tar.gz") {}
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs-14_x
    pkgs.yarn
    pkgs.libudev0-shim
    pkgs.python37
    pkgs.gnumake
    pkgs.curl
    pkgs.openssh
    pkgs.git
  ];
}
```
Now that the development environment is ready, run
`cd protocol-designer; make dev`

and then get hacking on the protocol designer.

# Caveats
The `shell.nix` file above let's me hack on the protocol designer already; but it doesn't support the root `make setup` command yet due to lack of support for the `usb-detection` npm package so far.

# See more

- https://nixos.org/download.html#nix-install-docker
- https://nixos.org/guides/declarative-and-reproducible-developer-environments.html
- https://dev.to/edbentley/nix-for-frontend-developers-64g
