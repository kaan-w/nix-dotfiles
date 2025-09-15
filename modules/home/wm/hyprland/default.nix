{
  imports = [
    ./binds.nix
    ./animations.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    # https://wiki.hypr.land/Useful-Utilities/Systemd-start/#installation
    systemd.enable = false;

    # https://wiki.hypr.land/Nix/Hyprland-on-Home-Manager/#using-the-home-manager-module-with-nixos
    package = null;
    portalPackage = null;

    # defaults: https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.conf
    settings = {
      # See https://wiki.hypr.land/Configuring/Monitors/
      monitor = [ ", highrr, auto, 1" ];

      # https://wiki.hypr.land/Configuring/Variables/#general
      general = {
        gaps_in = 5;
        gaps_out = 20;

        border_size = 2;

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      # https://wiki.hypr.land/Configuring/Variables/#decoration
      decoration = {
        rounding = 10;
        rounding_power = 2;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # color = "rgba(1a1a1aee)";
        };

        # https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # https://wiki.hypr.land/Configuring/Dwindle-Layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # https://wiki.hypr.land/Configuring/Master-Layout
      master = {
        new_status = "master";
      };

      # https://wiki.hypr.land/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
      };

      # https://wiki.hypr.land/Configuring/Variables/#input
      input = {
        kb_layout = "us, tr";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };
      
      # https://wiki.hypr.land/Configuring/Window-Rules/
      # https://wiki.hypr.land/Configuring/Workspace-Rules/
      windowrule = [
        "suppressevent maximize, class:.*" # Ignore maximize requests from apps.
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0" # Fix some dragging issues with XWayland
      ];

      layerrule = [
        "blur,vicinae"
        "ignorealpha 0, vicinae"
      ];
    };
  };
}
