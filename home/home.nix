{ config, pkgs, inputs, system, ... }: {
	imports = [
		./programs/bundle.nix
		./hypr/bundle.nix
		./gtk.nix
		./vesktop.nix
	];

	programs.home-manager.enable = true;
	home = {
		username = "zaer1n";
		homeDirectory = /home/zaer1n;
		packages = [
			pkgs.cargo
			pkgs.rustc
			pkgs.gcc
			pkgs.tclient-ddnet
			pkgs.spotify
			pkgs.python3
			pkgs.nautilus
			pkgs.overskride
			pkgs.pwvucontrol
			pkgs.hyprshot
			pkgs.vesktop
			pkgs.nil
			inputs.self.packages.${system}.audiorelay
			inputs.zen-browser.packages.${system}.specific
			inputs.self.packages.${system}.linux-wallpaperengine
		];
		pointerCursor = {	
			name = "Bibata-Modern-Ice";
			package = pkgs.bibata-cursors;
			size = 24;
			gtk.enable = true;
		};		
		stateVersion = "24.05";
	};

	# Temporary
	programs.rofi.enable = true;
}
