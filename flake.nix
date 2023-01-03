{
  description = "Frank's Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nix-colors, ... }:
    let
      system = [ "x86_64-linux" "x86_64-darwin" ];
    in
    {
      homeConfigurations = {
        DS720plus = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./nas-home.nix ];
          extraSpecialArgs = { inherit nix-colors; };
          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };

        jroberfr = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-darwin;
          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./mac-home.nix ];
          extraSpecialArgs = { inherit nix-colors; };
          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
      };
    };
}
