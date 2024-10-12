{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		zen-browser = {
			url = "github:ch4og/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	}; 
	outputs = { self, nixpkgs, home-manager, ... }@inputs:
		let
			system = "x86_64-linux";
			pkgs = import nixpkgs {
				inherit system;
				overlays = import ./overlays/bundle.nix; 
				config.allowUnfree = true;
			};
		in {
		packages.${system} = pkgs.callPackage ./pkgs/bundle.nix {};
		nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = { inherit inputs; inherit system; };
			modules = [
				./nixos/configuration.nix 
			];
		};
		homeConfigurations."zaer1n" = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			extraSpecialArgs = { inherit inputs; inherit system; };
			modules = [ 
				./home/home.nix 
			];
		};
	};
}
