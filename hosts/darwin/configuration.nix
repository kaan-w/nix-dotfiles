{ config, lib, inputs, user, ... }: {
  imports = [
    ../../modules/core/macos.nix
  ];

  # Necessary for using flakes on this system
  nix.settings.experimental-features = ["nix-command flakes"];

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
    casks = [ "zen" "proton-pass" ];
    masApps = {
      "ExcalidrawZ" = 6636493997;
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