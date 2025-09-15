{ pkgs, inputs, ...}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicetify-pkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;

    enabledExtensions = with spicetify-pkgs.extensions; [
      fullScreen
      volumePercentage
    ];
    enabledCustomApps = with spicetify-pkgs.apps; [
      lyricsPlus
    ];

    theme = spicetify-pkgs.themes.hazy // {
      additionalCss = ''
        .Root__top-container {
          background-color: rgba(0, 0, 0, 0.7);
          background-image: url("${(builtins.elemAt (import ../../assets/wallpapers.nix) 32).url}");
          background-size: cover;
          background-blend-mode: darken;
        }
      '';
    };
  };
}