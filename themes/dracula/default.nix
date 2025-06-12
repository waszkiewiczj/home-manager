
{ config, lib, pkgs, ... }:

{
    # terminal (macOS only)
    # TODO: enable only for macOS
    home.file.dracula-macos-terminal-theme = {
        enable = true;
        target = ".terminal-themes/dracula";
        source = pkgs.fetchFromGitHub {
            owner = "dracula";
            repo = "terminal-app";
            rev = "9d6b88a11c540852d79b795ea31df5835181036b";
            sha256 = "sha256-nDrqsMpTE4VIpdB7Bv2HSAdZnTGlj9ZDxXWE77XnMU0=";
        };
        recursive = true;
        # TODO: find a way to preserve Meslo font
        onChange = ''
            /usr/bin/open ~/.terminal-themes/dracula/Dracula.terminal
            /bin/sleep 5
            /usr/bin/pkill -x Terminal
            /usr/bin/defaults write com.apple.Terminal 'Default Window Settings' -string 'Dracula'
            /usr/bin/defaults write com.apple.Terminal 'Startup Window Settings' -string 'Dracula'
        '';
    };

    # vscode
    programs.vscode.profiles.default = {
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
    programs.zsh = {
        oh-my-zsh = {
            custom = "$HOME/.oh-my-zsh";
            theme = "dracula";
        };

        initContent = lib.mkBefore ''
            # nix-shell dracula integration
            if [ -n "''${IN_NIX_SHELL}" ]; then
                export DRACULA_CUSTOM_VARIABLE="(nix-shell ❄️)"
            fi
            # End nix-shell dracula integration
        '';
    };

    # k9s
    programs.k9s = {
        settings = {
            k9s = {
                ui = {
                    skin = "dracula";
                };
            };
        };
        skins = let 
            foreground = "#f8f8f2";
            background = "default";
            current_line = "#44475a";
            selection = "#44475a";
            comment = "#6272a4";
            cyan = "#8be9fd";
            green = "#50fa7b";
            orange = "#ffb86c";
            pink = "#ff79c6";
            purple = "#bd93f9";
            red = "#ff5555";
            yellow = "#f1fa8c";
        in {
            dracula = {
                k9s = {
                    body = {
                        fgColor = "${foreground}";
                        bgColor = "${background}";
                        logoColor = "${purple}";
                    };
                    prompt = {
                        fgColor = "${foreground}";
                        bgColor = "${background}";
                        suggestColor = "${purple}";
                    };
                    info = {
                        fgColor = "${pink}";
                        sectionColor = "${foreground}";
                    };
                    dialog = {
                        fgColor = "${foreground}";
                        bgColor = "${background}";
                        buttonFgColor = "${foreground}";
                        buttonBgColor = "${purple}";
                        buttonFocusFgColor = "${yellow}";
                        buttonFocusBgColor = "${pink}";
                        labelFgColor = "${orange}";
                        fieldFgColor = "${foreground}";
                    };
                    frame = {
                        border = {
                            fgColor = "${selection}";
                            focusColor = "${current_line}";
                        };
                        menu = {
                            fgColor = "${foreground}";
                            keyColor = "${pink}";
                            numKeyColor = "${pink}";
                        };
                        crumbs = {
                            fgColor = "${foreground}";
                            bgColor = "${current_line}";
                            activeColor = "${current_line}";
                        };
                        status = {
                            newColor = "${cyan}";
                            modifyColor = "${purple}";
                            addColor = "${green}";
                            errorColor = "${red}";
                            highlightColor = "${orange}";
                            killColor = "${comment}";
                            completedColor = "${comment}";
                        };
                        title = {
                            fgColor = "${foreground}";
                            bgColor = "${current_line}";
                            highlightColor = "${orange}";
                            counterColor = "${purple}";
                            filterColor = "${pink}";
                        };
                    };
                    views = {
                        charts = {
                            bgColor = "default";
                            defaultDialColors = [
                                "${purple}"
                                "${red}"
                            ];
                            defaultChartColors = [
                                "${purple}"
                                "${red}"
                            ];
                        };
                        table = {
                            fgColor = "${foreground}";
                            bgColor = "${background}";
                        };
                        header = {
                            fgColor = "${foreground}";
                            bgColor = "${background}";
                            sorterColor = "${cyan}";
                        };
                        xray = {
                            fgColor = "${foreground}";
                            bgColor = "${background}";
                            cursorColor = "${current_line}";
                            graphicColor = "${purple}";
                            showIcons = false;
                        };
                        yaml = {
                            keyColor = "${pink}";
                            colonColor = "${purple}";
                            valueColor = "${foreground}";
                        };
                        logs = {
                            fgColor = "${foreground}";
                            bgColor = "${background}";
                            indicator = {
                                fgColor = "${foreground}";
                                bgColor = "${purple}";
                                toggleOnColor = "${green}";
                                toggleOffColor = "${cyan}";
                            };
                        };
                    };
                };
            };
        };
    };
}