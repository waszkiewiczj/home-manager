
{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
        terraform
        terragrunt
    ];

    programs.zsh.oh-my-zsh.plugins = [
        "terraform"
    ];

    programs.vscode.profiles.default = {
        extensions = with pkgs.vscode-extensions; [
            hashicorp.terraform
            hashicorp.hcl
            jkillian.custom-local-formatters
        ];
        userSettings = {
            "[hcl]" = {
                "editor.defaultFormatter" = "jkillian.custom-local-formatters";
            };
            "customLocalFormatters.formatters" = [
                {
                    # full path needs to be specified as vscode does not recognize nix-installed binaries
                    "command" = "${pkgs.terraform}/bin/terraform fmt -";
                    "languages" = [
                        "hcl"
                    ];
                }
            ];
        };
    };
}