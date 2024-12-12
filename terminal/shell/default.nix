{ config, lib, pkgs, ... }:

{
    imports = [
        ./zsh.nix
        ./vim.nix
        ./git.nix
        ./tmux.nix
        ./fzf.nix
        ./direnv.nix
        ./bat.nix
    ];
}
