{ config, lib, pkgs, ... }:

{
    imports = [
        ./golang.nix
        ./python.nix
    ];
}