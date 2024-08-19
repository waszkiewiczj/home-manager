{ config, lib, pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        extensions = with pkgs.vscode-extensions; [
            dracula-theme.theme-dracula
            oderwat.indent-rainbow
            eamodio.gitlens
            vscodevim.vim
            bbenoist.nix
        ];
        userSettings = {
            "workbench.colorTheme" = "Dracula Theme";
        };
    };
}