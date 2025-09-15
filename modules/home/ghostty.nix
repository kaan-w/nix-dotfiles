{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    package = with pkgs; if stdenv.isDarwin then ghostty-bin else ghostty;

    settings = {
      window-padding-x = 14;
      window-padding-y = "0,6";
      macos-titlebar-style = "hidden";
      confirm-close-surface = false;
      font-feature = "+zero";
    };
  };
}