{ config, pkgs, ... }:
{
  imports = [
    ./shell
    ./vscode
    ./sdk
  ];
}
