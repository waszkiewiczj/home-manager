{ config, lib, pkgs, ... }:
let
  repoDir = builtins.dirOf (builtins.toString ./default.nix);
in
{
  imports = [
    ./terminal
    ./ui
    ./themes/dracula
  ];


  programs.zsh.initContent = lib.mkBefore ''
    # Verify if there are any remote changes to home-manager configuration
    if [ -n "$TMUX" ]; then
      OLD_CWD=$(pwd)
      cd ${repoDir}
      HOME_MANAGER_CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
      git fetch
      if [[ $(git log HEAD..origin/$HOME_MANAGER_CURRENT_BRANCH --oneline) ]]; then
        echo "\033[1;33mWARNING\033[0m: detected changes to home-manager configuration"
        echo "please pull them and run \`home-manager switch\`"
      fi
      cd $OLD_CWD
    fi
    # End verify
  '';
  
}
