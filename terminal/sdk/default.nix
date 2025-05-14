{ config, lib, pkgs, ... }:

{
    imports = [
        ./yaml.nix
        ./golang.nix
        ./python.nix
        ./gcloud.nix
        ./container.nix
        ./terraform.nix
    ];
}