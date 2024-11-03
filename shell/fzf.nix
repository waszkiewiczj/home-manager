{ config, lib, pkgs, ... }:

{
    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        tmux.enableShellIntegration = true;
    };

    programs.vim.plugins = with pkgs.vimPlugins; [
        fzf-vim
    ];
}   