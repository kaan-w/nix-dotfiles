{ pkgs, inputs, system, user, ... }: {
	programs.home-manager.enable = true;
	home = {
		username = user;
		homeDirectory = /home/${user};
		packages = [
			pkgs.spotify
			pkgs.nautilus
			pkgs.gthumb
			pkgs.baobab
			pkgs.dialect
			pkgs.overskride
			pkgs.pwvucontrol
			pkgs.hyprshot
			pkgs.vesktop
			pkgs.nixd
			pkgs.adwaita-icon-theme
			pkgs.obsidian
			pkgs.taterclient-ddnet
			pkgs.devenv
			pkgs.linux-wallpaperengine
			inputs.self.packages.${system}.audiorelay
			inputs.zen-browser.packages.${system}.specific
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
