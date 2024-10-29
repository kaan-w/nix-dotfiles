let
	wallpaper = builtins.toString ../../wallpapers/ganyu_window_sill.jpg;
in {
  services.hyprpaper = {
		enable = true;
		settings = {
			splash = false;
			ipc = false;
			preload = [ wallpaper ];
			wallpaper = [ (", " + wallpaper) ];
		};
	};
}