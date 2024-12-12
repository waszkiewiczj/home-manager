{ config, lib, pkgs, ... }:

{
    programs.direnv = {
        enable = true;
    };

    programs.zsh.oh-my-zsh.plugins = [
        "direnv"
    ];
}