{ config, lib, pkgs, ... }:

{   
    programs.tmux = {
        enable = true;
        mouse = false;
        clock24 = true;
        plugins = with pkgs.tmuxPlugins; [
            yank
            # TODO: find out why this overrides default shell
            # sensible
        ];
        escapeTime = 50;
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