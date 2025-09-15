{ pkgs, ... }: {
  security.pam.services.sudo_local.touchIdAuth = true;
  system.defaults = {
    dock = {
      tilesize = 48;
      magnification = true;
      largesize = 54;
      show-recents = false;
      minimize-to-application = true;
      persistent-apps = with pkgs; [
        { app = "${vscode}/Applications/Visual Studio Code.app"; }
        { app = "${ghostty-bin}/Applications/Ghostty.app"; }
        { app = "/Applications/Zen.app"; }
      ];
    };
    
    finder = {
      NewWindowTarget = "Home";
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
      CreateDesktop = false;
      QuitMenuItem = true;
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
    };

    controlcenter = {
      BatteryShowPercentage = true;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = true;

      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;

      "com.apple.swipescrolldirection" = false;
      "com.apple.mouse.tapBehavior" = 1;
    };

    CustomUserPreferences = {
      "com.apple.Siri" = {
        VoiceTriggerUserEnabled = 1;
      };
      
      "com.apple.AppleMultitouchTrackpad" = {
        TrackpadThreeFingerHorizSwipeGesture = 2;
        TrackpadThreeFingerVertSwipeGesture = 2;
      };

      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
    };
  };
}