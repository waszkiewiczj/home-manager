{ config, lib, pkgs, ... }:

{
    imports = [
        ./yaml.nix
        ./golang.nix
        ./python.nix
        ./javascript.nix
        ./gcloud.nix
        ./container.nix
        ./terraform.nix
    ];
}