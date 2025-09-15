{ lib, pkgs, inputs, ... }: {
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    package = lib.mkIf pkgs.stdenv.isDarwin (lib.mkForce null);

    policies = import ./config/policies.nix;

    profiles."default" = {
      name = "default";
      id = 0;
      isDefault = true;

      extensions = import ./config/extensions.nix { inherit pkgs; };
      settings = import ./config/settings.nix;
      search = import ./config/search.nix;
      bookmarks = import ./config/bookmarks.nix;
    };
  };
}