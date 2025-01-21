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
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-colors,
      homeage,
      darwin,
      ghostty,
      ...
    }:
    let
      commonModules = [ ];
    in
    {
      darwinConfigurations = {
        "frank@franks-MacBook-Pro" = darwin.lib.darwinSystem {
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
              home-manager.users.frank =
                { ... }:
                {
                  imports = commonModules ++ [ ./modules/darwin/home.nix ];
                };
              home-manager.extraSpecialArgs = {
                inherit nix-colors homeage ghostty;
              };
            }
          ];
        };
      };
      homeConfigurations = {
        "frank@LAPTOP-OTHG7ALT" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./modules/home/wsl.nix ];
          extraSpecialArgs = {
            inherit nix-colors homeage ghostty;
          };
        };
        "flo.wolfe@DS720plus" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./modules/home/nas.nix ];
          extraSpecialArgs = {
            inherit nix-colors homeage ghostty;
          };
        };
      };
    };
}
