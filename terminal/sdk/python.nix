{ config, lib, pkgs, ... }:

{
    programs.pyenv = {
        enable = true;
        enableZshIntegration = true;
    };

    programs.zsh.oh-my-zsh.plugins = [
        "python"
    ];

    programs.vscode.profiles.default = {
        extensions = with pkgs.vscode-extensions; [
            ms-python.python
            ms-python.debugpy
            ms-python.pylint
        ];
    };
}