{ config, pkgs, ... }:
{
  imports = [
    ./shell
    ./vscode
    ./sdk
    ./themes/dracula
  ];
}
