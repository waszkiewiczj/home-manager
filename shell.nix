{ config, lib, pkgs, ... }:

{
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

    programs.tmux = {
        enable = true;
        mouse = true;
        clock24 = true;
        plugins = with pkgs.tmuxPlugins; [
          yank
          sensible
          {
            plugin = dracula;
            extraConfig = ''
              set -g @dracula-show-battery false
              set -g @dracula-show-powerline true
              set -g @dracula-refresh-rate 10
            '';
          }
        ];
        extraConfig = ''
          set -g mouse on
        '';
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

    programs.vim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
            dracula-vim
            fzf-vim
            nerdtree
            lightline-vim
            vim-gitgutter
            vim-eunuch
            vim-indent-guides
        ];
        settings = {
            number = true;
            relativenumber = true;
        };
        extraConfig = ''
            let g:lightline = {
                \ 'colorscheme': 'one',
                \ }

            colorscheme dracula 

            let NERDTreeShowHidden=1
            " Start NERDTree. If a file is specified, move the cursor to its window.
            autocmd StdinReadPre * let s:std_in=1
            autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

            " Close NERDTree if it is the last window
            autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

            let g:indent_guides_enable_on_vim_startup = 1

            set list
            set listchars=eol:⏎,tab:>-,trail:⋅,extends:❯,precedes:❮,space:␣
        '';
      };

    programs.pyenv = {
      enable = true;
      enableZshIntegration = true;
    };
}
