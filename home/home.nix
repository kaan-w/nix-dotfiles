{
  pkgs,
  inputs,
  system,
  user,
  ...
}: {
  programs.home-manager.enable = true;
  home = {
    username = user;
    homeDirectory = /home/${user};
    packages = [
      pkgs.nautilus
      pkgs.gthumb
      pkgs.baobab
      pkgs.overskride
      pkgs.pwvucontrol
      pkgs.hyprshot
      pkgs.nixd
      pkgs.alejandra
      pkgs.adwaita-icon-theme
      pkgs.obsidian
      pkgs.taterclient-ddnet
      pkgs.devenv
      pkgs.protonvpn-gui
      pkgs.adwsteamgtk
      pkgs.pulseaudio
      pkgs.tty-clock
      pkgs.linux-wallpaperengine
      inputs.self.packages.${system}.audiorelay
      inputs.zen-browser.packages.${system}.default
    ];
    stateVersion = "25.05";
  };

  programs.fastfetch.enable = true;
  programs.cava.enable = true;
  programs.btop.enable = true;
  services.network-manager-applet.enable = true;
  programs.rofi.enable = true;
}
