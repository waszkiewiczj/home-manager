{ config, lib, pkgs, ... }:

{   
    programs.tmux = {
        enable = true;
        sensibleOnTop = false;
        mouse = false;
        clock24 = true;
        plugins = with pkgs.tmuxPlugins; [
            yank
        ];
        escapeTime = 50;
        terminal = "screen-256color"; # for proper highlighting style in autosuggestions
    };

    programs.zsh = {
        envExtra = ''
            export ZSH_TMUX_AUTOSTART="true"
            export ZSH_TMUX_AUTOCONNECT="false"
        '';

        oh-my-zsh.plugins = [
            # TODO: verify why I got 'open terminal failed: not a terminal' error
            # "tmux"
        ];
    };
}