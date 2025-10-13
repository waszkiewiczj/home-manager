{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
        gcc
        gnumake
        zlib
        libffi
        readline
        bzip2
        openssl
        ncurses
    ];

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

    programs.poetry = {
        enable = true;
    };

    programs.zsh = {
        oh-my-zsh.plugins = [
            "python"
            "pyenv"
            "poetry"
        ];

        initContent = lib.mkBefore ''
            export PYENV_ROOT="$HOME/.pyenv"
            export PATH="$PYENV_ROOT/bin:$PATH"
            eval "$(pyenv init --path)"
        '';

        # https://semyonsinchenko.github.io/ssinchenko/post/using-pyenv-with-nixos/
        envExtra = ''
            CPPFLAGS="-I${pkgs.zlib.dev}/include -I${pkgs.libffi.dev}/include -I${pkgs.readline.dev}/include -I${pkgs.bzip2.dev}/include -I${pkgs.openssl.dev}/include";
            CXXFLAGS="-I${pkgs.zlib.dev}/include -I${pkgs.libffi.dev}/include -I${pkgs.readline.dev}/include -I${pkgs.bzip2.dev}/include -I${pkgs.openssl.dev}/include";
            CFLAGS="-I${pkgs.openssl.dev}/include";
            LDFLAGS="-L${pkgs.zlib.out}/lib -L${pkgs.libffi.out}/lib -L${pkgs.readline.out}/lib -L${pkgs.bzip2.out}/lib -L${pkgs.openssl.out}/lib";
            CONFIGURE_OPTS="-with-openssl=${pkgs.openssl.dev}";
            PYENV_VIRTUALENV_DISABLE_PROMPT="1";
        '';
    };

    programs.vscode.profiles.default = {
        extensions = with pkgs.vscode-extensions; [
            ms-python.python
            ms-python.debugpy
            ms-python.pylint
        ];
        userSettings = {
            "pylint.path" = [
                "~/.pyenv/shims/pylint"
            ];
        };
    };
}