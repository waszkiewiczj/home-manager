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

    programs.zsh.oh-my-zsh.plugins = [
        "docker"
        "docker-compose"
        "kubectl"
    ];
}