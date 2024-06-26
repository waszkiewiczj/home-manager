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
                "pyenv"
                "gcloud"
            ];
        };
    };

    programs.tmux = {
        enable = true;
        mouse = true;
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
            theme = "GitHub";
        };
    };

    programs.vim = {
        enable = true;
        plugins = [
            pkgs.vimPlugins.onedark-vim
            pkgs.vimPlugins.fzf-vim
            pkgs.vimPlugins.nerdtree
            pkgs.vimPlugins.lightline-vim
            pkgs.vimPlugins.vim-gitgutter
            pkgs.vimPlugins.vim-eunuch
        ];
        settings = {
            number = true;
            relativenumber = true;
        };
        extraConfig = ''
            " onedark.vim override: Don't set a background color when running in a terminal;
            " just use the terminal's background color
            " `gui` is the hex color code used in GUI mode/nvim true-color mode
            " `cterm` is the color code used in 256-color mode
            " `cterm16` is the color code used in 16-color mode
            if (has("autocmd") && !has("gui_running"))
            augroup colorset
                autocmd!
                let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
                autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
            augroup END
            endif

            let g:lightline = {
                \ 'colorscheme': 'one',
                \ }

            colorscheme onedark

            let NERDTreeShowHidden=1
            " Start NERDTree. If a file is specified, move the cursor to its window.
            autocmd StdinReadPre * let s:std_in=1
            autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

            " Close NERDTree if it is the last window
            autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

            set list
            set listchars=eol:⏎,tab:>-,trail:⋅,extends:❯,precedes:❮,space:␣
        '';
    };
}
