
{ config, lib, pkgs, ... }:

{
    # required in macos so that nix-shell can use git
    programs.git.enable = true;

    home.packages = [
        pkgs.tig
    ];

    programs.zsh.oh-my-zsh.plugins = [
        "git"
    ];
}