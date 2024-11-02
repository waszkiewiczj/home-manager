{ config, lib, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        plugins = [
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
        oh-my-zsh = {
            enable = true;
        };
    };
}
