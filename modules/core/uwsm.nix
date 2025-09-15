{ lib, pkgs, ... }: let 
  mkUWSMDesktop = { name, prettyName, comment, binPath }: (pkgs.writeTextFile {
    name = "${name}-uwsm";
    text = ''
      [Desktop Entry]
      Name=${prettyName}
      Comment=${comment}
      Exec=${lib.getExe pkgs.uwsm} start -F ${binPath}
      Type=Application
    '';
    destination = "/share/wayland-sessions/${name}-uwsm.desktop";
    derivationArgs = {
      passthru.providedSessions = [ "${name}-uwsm" ];
    };
  });
in {
  programs.uwsm.enable = true;
  services.displayManager.sessionPackages = lib.mkForce [
    (mkUWSMDesktop {
      name = "niri";
      prettyName = "Niri";
      comment = "A scrollable-tiling Wayland compositor";
      binPath = "/run/current-system/sw/bin/niri-session";
    })
    (mkUWSMDesktop {
      name = "hyprland";
      prettyName = "Hyprland"; 
      comment = "An intelligent dynamic tiling Wayland compositor";
      binPath = "/run/current-system/sw/bin/Hyprland";
    })
  ];
}