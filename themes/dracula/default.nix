
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

    # fzf
    programs.fzf.colors = {
        fg = "#f8f8f2";
        "fg+" = "#f8f8f2";
        # bg = "#282a36"; # comment out to disable the background color (use shell bg instead)
        "bg+" = "#44475a";
        hl = "#bd93f9";
        "hl+" = "#bd93f9";
        info = "#ffb86c";
        prompt = "#50fa7b";
        pointer = "#ff79c6";
        marker = "#ff79c6";
        spinner = "#ffb86c";
        header = "#6272a4";
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