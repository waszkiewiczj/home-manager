{ config, lib, pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            dracula-theme.theme-dracula
            oderwat.indent-rainbow
            bbenoist.nix
        ];
        userSettings = {
            "workbench.colorTheme" = "Dracula Theme";
        };
    };
}