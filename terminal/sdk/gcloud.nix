{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
        (
            google-cloud-sdk.withExtraComponents [
                google-cloud-sdk.components.gke-gcloud-auth-plugin
            ]
        )
        (
            writeShellApplication {
                text = ''
                    #!/usr/bin/env bash

                    echo "Logging into gcloud..."

                    if ! gcloud auth print-access-token --quiet 1>/dev/null; then
                        echo "No gcloud credentials found, running 'gcloud auth login'"
                        gcloud auth login
                    fi

                    if ! gcloud auth application-default print-access-token --quiet 1>/dev/null; then
                        echo "No gcloud application default credentials found, running 'gcloud auth application-default login'"
                        gcloud auth application-default login
                    fi

                    echo "gcloud login completed"
                '';
                name = "gcloud-login";
            }
        )
    ];

    programs.zsh.oh-my-zsh.plugins = [
        "gcloud"
    ];
}
