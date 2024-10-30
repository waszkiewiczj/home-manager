{ config, lib, pkgs, ... }:

{
    programs.vim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
            dracula-vim
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
}   