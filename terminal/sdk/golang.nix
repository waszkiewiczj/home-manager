{ config, lib, pkgs, ... }:

{
    programs.go = {
        enable = true;
    };

    home.sessionPath = [
        "$HOME/go/bin"
    ];

    programs.zsh.oh-my-zsh = {
        plugins = [
            "golang"
        ];
    };

    programs.vscode = {
        extensions = with pkgs.vscode-extensions; [
            golang.go
        ];
        userSettings = {
            "go.alternateTools" = {
                "go" = "~/.nix-profile/bin/go";
            };
        };
    };
}