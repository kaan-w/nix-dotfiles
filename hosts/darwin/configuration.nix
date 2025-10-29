{ config, lib, inputs, user, ... }: {
  imports = [
    ../../modules/core/macos.nix
    ../../modules/core/nix.nix
  ];

  # The platform the configuration will be used on
  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ inputs.nur.overlays.default ];
  
  users.users.${user}.home = lib.mkDefault /Users/${user};
  system.primaryUser = user;

  # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.enable
  homebrew = {
    enable = true;
    brews = [ "cava" ];
    casks = [
      "zen"
      "proton-pass"
      "ente-auth"
      "excalidrawz"
      "aldente"
      "istat-menus"
    ];
    masApps = {
      "TestFlight" = 899247664;
      "Xcode" = 497799835;
    };

    # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.onActivation.cleanup
    onActivation.cleanup = "zap";

    # Align homebrew taps config with nix-homebrew
    taps = builtins.attrNames config.nix-homebrew.taps;
  };

  # Set Git commit hash for darwin-version
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}