{ config, lib, pkgs, ... }:

{
    imports = [
        ./zsh.nix
        ./vim.nix
        ./tmux.nix
        ./fzf.nix
        ./direnv.nix
        ./bat.nix
    ];

    home.packages = [
        pkgs.tig
    ];

}
