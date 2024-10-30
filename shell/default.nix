{ config, lib, pkgs, ... }:

{
    imports = [
        ./zsh.nix
        ./vim.nix
        ./tmux.nix
    ];

    home.packages = [
        pkgs.tig
    ];

    programs.direnv = {
        enable = true;
    };

    programs.fzf = {
        enable = true;
    };

    programs.bat = {
        enable = true;
        config = {
            theme = "Dracula";
        };
    };
}
