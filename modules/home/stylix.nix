{ config, lib, pkgs, inputs, ... }: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;
    image = pkgs.fetchurl (builtins.elemAt (import ../../assets/wallpapers.nix) 12);
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/vesper.yaml";

    cursor = lib.mkIf pkgs.stdenv.isLinux {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    iconTheme = lib.mkIf pkgs.stdenv.isLinux {
      enable = true;
      dark = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    overlays.enable = false;

    targets = {
      gtk.extraCss = ''
        @define-color sidebar_bg_color #${config.lib.stylix.colors.base00};
        @define-color headerbar_bg_color #${config.lib.stylix.colors.base00};
      '';
      vscode.enable = false;
      zen-browser.enable = false;
      firefox.enable = false;
      spicetify.enable = false;
    };
  };
}