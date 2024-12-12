{ config, lib, pkgs, ... }:

{
    home.packages = [
        pkgs.meslo-lgs-nf
    ];

    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            oderwat.indent-rainbow
            eamodio.gitlens
            vscodevim.vim
            bbenoist.nix
            ms-vscode.makefile-tools
        ];
        userSettings = {
            "editor.fontFamily" = "MesloLGS NF";
        };
    };
}