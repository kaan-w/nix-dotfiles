{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    enable = true;
    image = pkgs.fetchurl (builtins.elemAt (import ../wallpapers.nix) 3);
    polarity = "dark";
    cursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
    iconTheme = {
      enable = true;
      dark = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };
    targets = {
      gtk.extraCss = ''
        @define-color sidebar_bg_color #${config.stylix.base16Scheme.base00};
        @define-color headerbar_bg_color #${config.stylix.base16Scheme.base00};
      '';
      vscode.enable = false;
      vesktop.enable = false;
      spicetify.enable = false;
    };
  };
}
