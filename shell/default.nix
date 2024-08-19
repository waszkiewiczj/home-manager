{ config, lib, pkgs, ... }:

{
    imports = [
        ./vim.nix
        ./tmux.nix
    ];

    home.packages = [
        pkgs.tig
        pkgs.k9s
    ];

    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        plugins = [
            {
                name = "powerlevel10k";
                src = pkgs.zsh-powerlevel10k;
                file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
            {
                name = "powerlevel10k-config";
                src = lib.cleanSource ./p10k-config;
                file = "p10k.zsh";
            }
        ];
        envExtra = ''
            export ZSH_TMUX_AUTOSTART="true"
            export ZSH_TMUX_AUTOCONNECT="false"
        '';
        oh-my-zsh = {
            enable = true;
            plugins = [
                "tmux"
                "fzf"
                "direnv"
                "git"
                "docker"
                "docker-compose"
                "kubectl"
                "ansible"
                "terraform"
                "gcloud"
            ];
        };
    };

    programs.direnv = {
        enable = true;
    };

    programs.fzf = {
        enable = true;
    };

    programs.bat = {
        enable = true;
        config = {
            theme = "Dracula";
        };
    };

    programs.pyenv = {
        enable = true;
        enableZshIntegration = true;
    };
}
