
{ config, lib, pkgs, ... }:

{
    # vscode
    programs.vscode = {
        extensions = with pkgs.vscode-extensions; [
            dracula-theme.theme-dracula
        ];
        userSettings = {
            "workbench.colorTheme" = "Dracula Theme";
        };
    };

    # vim
    programs.vim = {
        plugins = with pkgs.vimPlugins; [
            dracula-vim
        ];
        extraConfig = ''
            colorscheme dracula
        '';
    };

    # tmux
    programs.tmux.plugins = with pkgs.tmuxPlugins; [
        {
            plugin = dracula;
            extraConfig = ''
                set -g @dracula-plugins "ssh-session cpu-usage ram-usage"
                set -g @dracula-show-powerline true
                set -g @dracula-refresh-rate 5
            '';
        }
    ];

    # bat
    programs.bat.config = {
        theme = "Dracula";
    };
}