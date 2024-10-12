{ pkgs, ... }: {
  gtk = {
		enable = true;
		iconTheme = {
			name = "Adwaita";
			package = pkgs.adwaita-icon-theme;
		};
		theme = {
			name = "adw-gtk3-dark";
			package = pkgs.adw-gtk3;
		};
	};
}