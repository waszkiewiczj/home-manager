{ config, lib, pkgs, ... }:

{
    imports = [
        ./zsh.nix
        ./vim.nix
        ./tmux.nix
        ./fzf.nix
    ];

    home.packages = [
        pkgs.tig
    ];

    programs.direnv = {
        enable = true;
    };

    programs.bat = {
        enable = true;
        config = {
            theme = "Dracula";
        };
    };
}
