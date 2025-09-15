{
  wayland.windowManager.hyprland.settings = {
    # https://wiki.hypr.land/Configuring/Binds
    bind = [
      "SUPER, Q, exec, ghostty"
      "SUPER, E, exec, nautilus"
      "SUPER, R, exec, vicinae"
      "SUPER, C, killactive"
      "SUPER, M, exit"
      "SUPER, V, togglefloating"
      "SUPER, S, exec, hyprshot --mode region --output-folder ~/Pictures"
      "SUPER SHIFT, S, exec, hyprshot --mode region --clipboard-only"
      "SUPER, SPACE, exec, hyprctl switchxkblayout all next"

      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"

      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER SHIFT, 0, movetoworkspace, 10"
      "SUPER, mouse_down, workspace, e+1"
      "SUPER, mouse_up, workspace, e-1"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}