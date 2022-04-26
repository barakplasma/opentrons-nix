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
