{ pkgs, inputs, ... }: {
  imports = [
    ../../modules/home/wm/hyprland
    ../../modules/home/wm/niri

    ../../modules/home/browsers/zen.nix
    ../../modules/home/browsers/firefox.nix

    ../../modules/home/cmd/fastfetch.nix
    ../../modules/home/cmd/bat.nix
    ../../modules/home/cmd/direnv.nix
    ../../modules/home/cmd/zsh.nix
    ../../modules/home/cmd/git.nix
    ../../modules/home/cmd/zoxide.nix
    ../../modules/home/cmd/starship.nix
    ../../modules/home/cmd/nh.nix

    ../../modules/home/ghostty.nix
    ../../modules/home/vscode.nix
    ../../modules/home/vicinae.nix
    ../../modules/home/spicetify.nix
    ../../modules/home/stylix.nix
    ../../modules/home/mako.nix

    inputs.niri.homeModules.stylix
  ];

  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    nautilus
    adwaita-icon-theme
    nixd
    overskride
    pwvucontrol
    hyprshot
    gemini-cli
    nur.repos.slaier.audiorelay
    self'.packages.lncrawl
    taterclient-ddnet
    wireguard-tools
    nix-prefetch
    cloc
    obs-studio
    gthumb
    proton-pass
    (ente-auth.overrideAttrs (f: p: {
      desktopItems = [(
        (builtins.elemAt p.desktopItems 0).override { 
          icon = "${pkgs.ente-auth}/share/pixmaps/enteauth.png"; 
        }
      )];
    }))
  ];

  xdg.desktopEntries.audiorelay = {
    name = "AudioRelay";
    comment = "Stream audio between your devices";
    icon = "${pkgs.nur.repos.slaier.audiorelay}/share/pixmaps/audiorelay.png";
    exec = "audiorelay";
    startupNotify = true;
  };

  programs.fd.enable = true;
  programs.eza.enable = true;
  programs.ripgrep.enable = true;
  programs.jq.enable = true;
  programs.fzf.enable = true;
  programs.cava.enable = true;
  programs.btop.enable = true;
}
