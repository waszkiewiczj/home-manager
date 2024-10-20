{ config, lib, pkgs, ... }:

{
    home.packages = [
        pkgs.meslo-lgs-nf
    ];

    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            dracula-theme.theme-dracula
            oderwat.indent-rainbow
            eamodio.gitlens
            vscodevim.vim
            bbenoist.nix
            golang.go
            ms-vscode.makefile-tools
        ];
        userSettings = {
            "workbench.colorTheme" = "Dracula Theme";
            "editor.fontFamily" = "MesloLGS NF";
            "go.alternateTools" = {
                "go" = "~/.nix-profile/bin/go";
            };
        };
    };
}