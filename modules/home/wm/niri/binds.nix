{ config, ... }: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Super+Q".action = spawn "ghostty";
    "Super+R".action = spawn "vicinae";
    "Super+E".action = spawn "nautilus";
    "Super+C".action = close-window;
    "Super+M".action = quit;
    "Super+D".action = switch-preset-column-width;
    "Super+V".action = toggle-window-floating;
    "Super+F".action = toggle-overview;
    "Super+Space".action = switch-layout "next";
    "Super+S".action = spawn [ "hyprshot" "--mode" "region" "--output-folder" "Pictures" ];
    "Super+Shift+S".action = spawn [ "hyprshot" "--mode" "region" "--clipboard-only" ];

    "Super+Comma".action = consume-window-into-column;
    "Super+Period".action = expel-window-from-column;
    "Super+BracketLeft".action = consume-or-expel-window-left;
    "Super+BracketRight".action = consume-or-expel-window-right;

    "Super+WheelScrollDown" = {
      action = focus-workspace-down;
      cooldown-ms = 150;
    };
    "Super+WheelScrollUp" = {
      action = focus-workspace-up;
      cooldown-ms = 150;
    };
    "Super+Ctrl+WheelScrollDown" = {
      action = move-column-to-workspace-down;
      cooldown-ms = 150;
    };
    "Super+Ctrl+WheelScrollUp" = {
      action = move-column-to-workspace-up;
      cooldown-ms = 150;
    };

    "Super+WheelScrollRight".action = focus-column-right;
    "Super+WheelScrollLeft".action = focus-column-left;
    "Super+Ctrl+WheelScrollRight".action = move-column-right;
    "Super+Ctrl+WheelScrollLeft".action = move-column-left;

    "Super+Shift+WheelScrollDown".action = focus-column-right;
    "Super+Shift+WheelScrollUp".action = focus-column-left;
    "Super+Ctrl+Shift+WheelScrollDown".action = move-column-right;
    "Super+Ctrl+Shift+WheelScrollUp".action = move-column-left;

    "Super+1".action.focus-workspace = 1;
    "Super+2".action.focus-workspace = 2;
    "Super+3".action.focus-workspace = 3;
    
    "Super+Shift+1".action.move-column-to-workspace = 1;
    "Super+Shift+2".action.move-column-to-workspace = 2;
    "Super+Shift+3".action.move-column-to-workspace = 3;

    "Super+Left".action = focus-column-left-or-last;
    "Super+Right".action = focus-column-right-or-first;
  };
}