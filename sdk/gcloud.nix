{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
        (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
    ];

    programs.zsh.oh-my-zsh.plugins = [
        "gcloud"
    ];
}
