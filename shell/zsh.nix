{ config, lib, pkgs, ... }:

{
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
            {
                name = "alias-tips";
                src = pkgs.fetchFromGitHub {
                    owner = "djui";
                    repo = "alias-tips";
                    rev = "41cb143ccc3b8cc444bf20257276cb43275f65c4";
                    sha256 = "sha256-ZFWrwcwwwSYP5d8k7Lr/hL3WKAZmgn51Q9hYL3bq9vE=";
                };
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
                "ansible"
                "terraform"
            ];
        };
    };
}
