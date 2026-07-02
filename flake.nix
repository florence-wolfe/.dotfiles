{
  description = "Flo's Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homeage = {
      url = "github:jordanisaacs/homeage";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      # Pinned to the release branch matching nixpkgs 25.05 (master tracks the
      # next unstable and errors on a version mismatch). This branch still has
      # `system.primaryUser`, which we require.
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nix-colors,
      homeage,
      darwin,
      ...
    }:
    let
      commonModules = [ ];
    in
    {
      darwinConfigurations = {
        "flos-MacBook-Pro" = darwin.lib.darwinSystem {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnfree = true;
            config.allowUnsupportedSystem = true;
          };
          modules = [
            ./modules/darwin
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              # Move any pre-existing dotfiles (e.g. ~/.zshrc) aside instead of
              # aborting activation when home-manager wants to manage them.
              home-manager.backupFileExtension = "backup";
              home-manager.users.flo =
                { ... }:
                {
                  imports = commonModules ++ [ ./modules/darwin/home.nix ];
                };
              home-manager.extraSpecialArgs = {
                inherit
                  nix-colors
                  homeage
                  ;
              };
            }
          ];
        };
	    "flo" = darwin.lib.darwinSystem {
          pkgs = import nixpkgs {
            system = "aarch64-darwin";
            config.allowUnfree = true;
            config.allowUnsupportedSystem = true;
          };
          modules = [
	          ({ ... }: {
              nix.enable = false;
            })
            ./modules/darwin
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              # Move any pre-existing dotfiles (e.g. ~/.zshrc) aside instead of
              # aborting activation when home-manager wants to manage them.
              home-manager.backupFileExtension = "backup";
              home-manager.users.flo =
                { ... }:
                {
                  imports = commonModules ++ [ ./modules/darwin/home.nix ];
                };
              home-manager.extraSpecialArgs = {
                inherit
                  nix-colors
                  homeage
                  ;
              };
            }
          ];
        };
      };
      homeConfigurations = {
        "flo@DESKTOP-VAKDGVR" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./modules/home/wsl.nix ];
          extraSpecialArgs = {
            inherit
              nix-colors
              homeage
              ;
          };
        };
        "flo.wolfe@DS720plus" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./modules/home/nas.nix ];
          extraSpecialArgs = {
            inherit
              nix-colors
              homeage
              ;
          };
        };
      };
    };
}
