{ config, lib, pkgs, ... }:

{
    programs.pyenv = {
        enable = true;
        enableZshIntegration = false;
        package = pkgs.pyenv.overrideAttrs (oldAttrs: {
            buildInputs = with pkgs; [
                cacert
                git
            ];
            postInstall =  oldAttrs.postInstall + ''
                git clone https://github.com/pyenv/pyenv-virtualenv.git $out/plugins/pyenv-virtualenv
            '';
        });
    };

    programs.zsh.oh-my-zsh.plugins = [
        "python"
        "pyenv"
    ];

    programs.vscode.profiles.default = {
        extensions = with pkgs.vscode-extensions; [
            ms-python.python
            ms-python.debugpy
            ms-python.pylint
        ];
    };
}