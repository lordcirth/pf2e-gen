# shell.nix
let
  # We pin to a specific nixpkgs commit for reproducibility.
  # Last updated: 2026-01-29 (25.11 stable). Check for new commits at https://status.nixos.org.
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/fa83fd837f3098e3e678e6cf017b2b36102c7211.tar.gz") {};
in pkgs.mkShell {
  packages = [
    pkgs.jinja2-cli
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      # select Python packages here
      #pandas
      #requests
    ]))
  ];
}
