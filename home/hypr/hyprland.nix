{
  # Defaults: https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.conf
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			env = [
				"XCURSOR_SIZE, 24"
        "HYPRCURSOR_SIZE, 24"
			];
	
			monitor = ", highrr, auto, 1";
			
			general = {
				gaps_in = 5;
				gaps_out = 20;
				border_size = 2;

				"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
				"col.inactive_border" = "rgba(595959aa)";
				resize_on_border = false;
				allow_tearing = false;
				layout = "dwindle";
			};

			decoration = {
				rounding = 10;
				active_opacity = "1.0";
				inactive_opacity = "1.0";
				drop_shadow = true;
				shadow_range = 4;
				shadow_render_power = 3;
				"col.shadow" = "rgba(1a1a1aee)";
				
				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = "0.1696";
				};
			};
			
			animations = {
				enabled = true;
				bezier = "MyBezier, 0.05, 0.9, 0.1, 1.05";
				animation = [
					"windows, 1, 7, MyBezier"
					"windowsOut, 1, 7, default, popin 80%"
					"border, 1, 10, default"
					"borderangle, 1, 8, default"
					"fade, 1, 7, default"
					"workspaces, 1, 6, default"
				];	
			};	
			
			dwindle = {
				pseudotile = true;
				preserve_split = true;	
			};

			master = {
				new_status = "master";
			};

			misc = {
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
			};
			
			input = {
				kb_layout = "us";
				follow_mouse = 1;
				sensitivity = 0;
			};

			gestures = {
				workspace_swipe = false;
			};
			
			"$mod" = "SUPER";
			bind = [
				"$mod, Q, exec, kitty"
				"$mod, E, exec, nautilus"
				"$mod, R, exec, rofi -show drun"
				"$mod, C, killactive,"
				"$mod, M, exit,"
				"$mod, V, togglefloating,"
				"$mod, P, pseudo,"
				"$mod, J, togglesplit,"
				"$mod, left, movefocus, l"
				"$mod, right, movefocus, r"
				"$mod, up, movefocus, u"
				"$mod, down, movefocus, d"
				"$mod, S, exec, hyprshot -m region" # (!)
			] ++ (
				builtins.concatLists (builtins.genList (i:
					let ws = i + 1;
					in [
						"$mod, code:1${toString i}, workspace, ${toString ws}"
						"$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"	
					]
				)
				9)
			);

			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];

			windowrulev2 = [
				"suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
				"opacity 0.8 0.8, class:^(kitty)$" # (?)
			];	
		};
	};
}
