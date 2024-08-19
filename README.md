# Home Manager setup

In order to apply this setup:
1. Clone this repository in selected location
2. Modify default Home Manager configuration file (usually located in `~/.config/home-manager/home.nix`) adding proper import:
    ```nix
    { config, pkgs, ... }:

    { 
      # ...
      imports = 
        [
          <path-to-cloned-repository>
        ];
    }
    ```
    **NOTE:** This setup also use some unfree packages (i.e. VSCode). In order to use them use env var `NIXPGS_ALLOW_UNFREE=1` whenever updating the setup or add this to Home Manager config to allow them permanently:
    ```nix
    { config, pkgs, ... }:

    { 
      nixpkgs = {
        config = {
          allowUnfree = true;
        };
      };
      # ...
    }
    ```
3. Switch Home Manager revision by running
    ```bash
    home-manager switch
    ```
