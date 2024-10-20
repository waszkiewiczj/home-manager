{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
        docker-client
        colima
        kubectl
        k9s
        k3d
    ];

}