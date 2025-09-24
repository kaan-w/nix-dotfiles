{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    niri = {
      url = "github:sodiboo/niri-flake";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    vicinae = {
      url = "github:vicinaehq/vicinae";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, flake-parts, ... }: let
    user = "kaanw";
  in
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        templates = builtins.mapAttrs
          (name: _: {path = ./templates/${name};})
          (builtins.readDir ./templates);

        nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux"; 
          specialArgs = { 
            inherit inputs user; 
            host = "nixos"; 
          };
          modules = [
            ./hosts/nixos/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = ./hosts/nixos/home.nix;
              home-manager.extraSpecialArgs = { 
                inherit inputs user;
                host = "nixos";
              };
            }
          ];
        };

        darwinConfigurations."darwin" = inputs.nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs user;
            host = "darwin";
          };
          modules = [
            ./hosts/darwin/configuration.nix
            inputs.home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = ./hosts/darwin/home.nix;
              home-manager.extraSpecialArgs = { 
                inherit inputs user;
                host = "darwin";
              };
            }
            inputs.nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                inherit user;
                taps = {
                  "homebrew/homebrew-core" = inputs.homebrew-core;
                  "homebrew/homebrew-cask" = inputs.homebrew-cask;
                };
                mutableTaps = false;
              };
            }
          ];
        };
      };

      systems = import inputs.systems;

      perSystem = { pkgs, ... }: {
        packages = nixpkgs.lib.filesystem.packagesFromDirectoryRecursive {
          inherit (pkgs) callPackage;
          directory = ./packages;
        };
      };
    };
}
