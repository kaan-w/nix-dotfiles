{
  inputs,
  system,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;

    config = {
      showResultsImmediately = true;
      y.fraction = 0.3;

      plugins = with inputs.anyrun.packages.${system}; [
        applications
      ];
    };

    extraCss = ''
      #window {
        background: transparent;
      }

      box#main {
        border-radius: 16px;
      }
    '';
  };
}
