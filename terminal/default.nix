{ config, lib, pkgs, ... }:

{
    imports = [
        ./shell
        ./sdk
    ];

    home.packages = with pkgs; [
        # By default macOS is not running GNU grep (i.e. -P option missing)
        gnugrep
    ];
}
