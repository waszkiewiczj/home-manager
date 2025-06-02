
{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
        terraform
        terragrunt
    ];

    programs.zsh.oh-my-zsh.plugins = [
        "terraform"
    ];

    programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
        hashicorp.terraform
    ];
}