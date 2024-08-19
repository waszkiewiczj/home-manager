{ config, lib, pkgs, ... }:

{   
    programs.tmux = {
        enable = true;
        mouse = false;
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
        '';
    };
}