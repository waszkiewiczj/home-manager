{ config, lib, pkgs, ... }:

{
    programs.fzf = {
        enable = true;
    };

    programs.zsh.oh-my-zsh.plugins = [
        "fzf"
    ];

    programs.vim.plugins = with pkgs.vimPlugins; [
        fzf-vim
    ];
}   