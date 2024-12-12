{ config, pkgs, ... }:
{
  imports = [
    ./terminal
    ./ui
    ./themes/dracula
  ];
}
