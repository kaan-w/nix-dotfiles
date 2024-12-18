{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		stylix = {
			url = "github:danth/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	}; 
	outputs = { self, nixpkgs, home-manager, ... }@inputs:
		let
			system = "x86_64-linux";
			inherit (nixpkgs.lib) filesystem;
			pkgs = import nixpkgs {
				inherit system;
				# overlays = builtins.map (x: import x) (filesystem.listFilesRecursive ./overlays);
				config.allowUnfree = true;
			};
			user = "zaer1n";
		in {
		packages.${system} = filesystem.packagesFromDirectoryRecursive { 
			inherit (pkgs) callPackage;
			directory = ./pkgs; 
		};
		nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = { inherit inputs system user; };
			modules = [
				./nixos/configuration.nix 
			];
		};
		homeConfigurations."zaer1n" = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			extraSpecialArgs = { inherit inputs system user; };
			modules = (filesystem.listFilesRecursive ./home) ++ [
				inputs.stylix.homeManagerModules.stylix
			];
		};
	};
}