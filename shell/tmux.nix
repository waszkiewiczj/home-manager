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
                    set -g @dracula-plugins "ssh-session cpu-usage ram-usage"
                    set -g @dracula-show-powerline true
                    set -g @dracula-refresh-rate 5
                '';
            }
        ];
        extraConfig = ''
        '';
    };
}