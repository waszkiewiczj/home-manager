{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
        yq-go
    ];

    programs.vscode.extensions = with pkgs.vscode-extensions; [
        redhat.vscode-yaml
    ];
}