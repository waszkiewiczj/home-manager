{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
        colima
        docker-client
        docker-compose
        docker-credential-helpers
        kubectl
        k9s
        k3d
    ];

}