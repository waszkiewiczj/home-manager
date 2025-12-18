{ config, lib, pkgs, ... }:

{
    # WARNING - REMEMBER TO RESTART TMUX (`tmux kill-server`) AFTER UPDATE
    # https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=291325#c4
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
            "tmux"
        ];
    };
}