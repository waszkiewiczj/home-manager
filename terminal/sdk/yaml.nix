{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
        yq-go
    ];

    programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
        redhat.vscode-yaml
    ];
}