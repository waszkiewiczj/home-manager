{ config, lib, pkgs, ... }:

{
    imports = [
        ./zsh.nix
        ./vim.nix
        ./tmux.nix
        ./container.nix
    ];

    home.packages = [
        pkgs.tig
        pkgs.k9s
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
