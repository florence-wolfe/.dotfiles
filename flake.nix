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
      commonModules = [ ];
    in
    {
      homeConfigurations = {
        "frank@LAPTOP-OTHG7ALT" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./modules/home/wsl.nix ];
          extraSpecialArgs = { inherit nix-colors homeage; };
        };
        "frank.robert@DS720plus" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          modules = commonModules ++ [ ./modules/home/nas.nix ];
          extraSpecialArgs = { inherit nix-colors homeage; };
        };
      };
    };
}
