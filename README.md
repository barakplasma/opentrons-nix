# opentrons-nix
How to setup a dev environment for Opentrons using nix

The `DEV_SETUP.md` for opentrons is quite complicated, with many manual steps, especially if someone only wants to work on part of opentrons. This repo shows you how to create a development environment with nix-shell as an alternative.

1. download the file [shell.nix](./shell.nix)
1. Install Nix (or use Nix docker)
    1. To use docker, install docker, then run `$ docker run -it -p 8080:8080 -v $(pwd)/:/workdir nixos/nix` from within the opentrons mono-repo
1. run `$ cd workdir` then `$ nix-shell`
1. done!

Now that the development environment is ready, you can run

`$ make setup`
to download and compile dependencies

`$ cd protocol-designer; make dev`
to start hacking on the protocol designer (for example)

# See more

- https://nixos.org/download.html#nix-install-docker
- https://nixos.org/guides/declarative-and-reproducible-developer-environments.html
- https://dev.to/edbentley/nix-for-frontend-developers-64g
