{ pkgs, inputs, ... }: {
  imports = [
    inputs.vicinae.homeManagerModules.default
    inputs.vicinae-extensions.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
    autoStart = true;

    settings = {
      faviconService = "twenty";
      font.size = 11;
      popToRootOnClose = false;
      rootSearch.searchFiles = false;
      theme.name = "vicinae-dark";
      window = {
        csd = true;
        opacity = 0.85;
        rounding = 10;
      };
    };

    extensions = with inputs.vicinae-extensions.packages.${pkgs.system}; [
      powermenu
    ];
  };
}