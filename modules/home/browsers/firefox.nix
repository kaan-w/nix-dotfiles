{ pkgs, ... }: {
  programs.firefox = {
    enable = true;

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