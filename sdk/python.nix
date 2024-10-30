{ config, lib, pkgs, ... }:

{
    programs.pyenv = {
        enable = true;
        enableZshIntegration = true;
    };

    programs.zsh.oh-my-zsh.plugins = [
        "python"
    ];
}