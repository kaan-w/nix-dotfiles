{
  inputs,
  system,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicetify-pkgs = inputs.spicetify-nix.legacyPackages.${system};
  in {
    enable = true;
    enabledExtensions = with spicetify-pkgs.extensions; [
      fullScreen
      betterGenres
      volumePercentage
    ];
    enabledCustomApps = with spicetify-pkgs.apps; [
      lyricsPlus
      historyInSidebar
    ];
    theme = spicetify-pkgs.themes.hazy;
  };
}
