
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

    # zsh
    home.file.dracula-zsh-theme = {
        enable = true;
        target = ".oh-my-zsh/themes/";
        source = pkgs.fetchFromGitHub {
            owner = "dracula";
            repo = "zsh";
            rev = "75ea3f5e1055291caf56b4aea6a5d58d00541c41";
            sha256 = "sha256-TuKC1wPdq2OtEeViwnAmitpdaanyXHJmBcqV+rHxy34=";
        };
        recursive = true;
    };
    programs.zsh.oh-my-zsh = {
        custom = "$HOME/.oh-my-zsh";
        theme = "dracula";
    };
}