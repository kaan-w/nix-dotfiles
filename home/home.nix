{ config, pkgs, inputs, system, ... }: {
	programs.home-manager.enable = true;
	home = {
		username = "zaer1n";
		homeDirectory = /home/zaer1n;
		packages = [
			pkgs.spotify
			pkgs.nautilus
			pkgs.overskride
			pkgs.pwvucontrol
			pkgs.hyprshot
			pkgs.vesktop
			pkgs.nixd
			pkgs.adwaita-icon-theme
			pkgs.obsidian
			pkgs.taterclient-ddnet
			pkgs.direnv
			pkgs.devenv
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
