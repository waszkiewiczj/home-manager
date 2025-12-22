{ config, lib, pkgs, ... }:

{
    home.packages = [
        pkgs.meslo-lgs-nf
    ];

    programs.vscode = {
        enable = true;

        profiles.default = {
            extensions = with pkgs.vscode-extensions; [
                oderwat.indent-rainbow
                eamodio.gitlens
                vscodevim.vim
                bbenoist.nix
                ms-vscode.makefile-tools
                ms-vscode-remote.remote-containers
                jebbs.plantuml
                ms-vscode-remote.remote-ssh
            ];
            userSettings = {
                "editor.fontFamily" = "MesloLGS NF";
                "workbench.activityBar.location" = "top";
                "editor.minimap.autohide" = "mouseover";
                "terminal.integrated.suggest.enabled" = false;
            };
        };
    };
}