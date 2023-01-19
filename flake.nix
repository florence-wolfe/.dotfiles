{
  description = "Frank's Home Manager configuration";

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
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nix-colors
    , homeage
    , darwin
    , ...
    }:
    let
      commonModules = [ ./modules/custom/lazyvim.nix ./modules/custom/pvim.nix ];
    in
    {
      darwinConfigurations = {
        "jroberfr@88665a49c72f.ant.amazon.com" =
          let
            system = "x86_64-darwin";
          in
          darwin.lib.darwinSystem
            {
              inherit system;
              pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
                config.allowUnsupportedSystem = true;
              };
              modules = [
                ./modules/darwin
                home-manager.darwinModules.home-manager
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.users.jroberfr = { ... }: {
                    imports = commonModules ++ [ ./modules/darwin/home.nix ];
                  };
                  home-manager.extraSpecialArgs = { inherit nix-colors homeage; };
                }
              ];
            };
      };
      homeConfigurations = {
        "frank.robert@DS720plus" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./nas-home.nix ];
          extraSpecialArgs = { inherit nix-colors homeage; };
        };

        "frank@LAPTOP-OTHG7ALT" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./linux-home.nix ];
          extraSpecialArgs = { inherit nix-colors homeage; };
        };
      };
    };
}
