{ config, lib, pkgs, ... }:

let
  pkgs-2511 = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-25.11.tar.gz";
    # sha256 = ""; # Uncomment and add hash for reproducible builds
  }) {
    inherit (pkgs) system config;
  };
in
{
    home.packages = (with pkgs; [
        colima
        docker-credential-helpers
        kubectl
        k3d
    ]) ++ (with pkgs-2511; [
        # TODO: remove this once the issues with docker compose and buildx plugins is resolved
        # ref: https://github.com/NixOS/nixpkgs/issues/424333
        docker-client
        docker-compose
    ]);

    programs.zsh.oh-my-zsh.plugins = [
        "docker"
        "docker-compose"
        "kubectl"
    ];

    programs.k9s = {
        enable = true;
    };
}