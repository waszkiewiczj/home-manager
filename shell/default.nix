{ config, lib, pkgs, ... }:

{
    imports = [
        ./zsh.nix
        ./vim.nix
        ./tmux.nix
        ./fzf.nix
        ./direnv.nix
    ];

    home.packages = [
        pkgs.tig
    ];

    programs.bat = {
        enable = true;
        config = {
            theme = "Dracula";
        };
    };
}
