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
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nix-colors
    , homeage
    , ...
    }:
    let
      commonModules = [ ./modules/lazyvim.nix ./modules/pvim.nix ];
    in
    {
      homeConfigurations = {
        "frank.robert@DS720plus" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./nas-home.nix ];
          extraSpecialArgs = { inherit nix-colors homeage; };
        };

        "jroberfr@88665a49c72f.ant.amazon.com" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-darwin";
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./mac-home.nix ];
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
