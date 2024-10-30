
{ config, lib, pkgs, ... }:

{
    home.packages = [
        pkgs.tig
    ];

    programs.zsh.oh-my-zsh.plugins = [
        "git"
    ];
}