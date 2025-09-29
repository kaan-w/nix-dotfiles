{ lib, pkgs, inputs, user, ... }: {
  imports = [
    ../../modules/home/browsers/zen.nix
    ../../modules/home/browsers/firefox.nix

    ../../modules/home/cmd/fastfetch.nix
    ../../modules/home/cmd/bat.nix
    ../../modules/home/cmd/direnv.nix
    ../../modules/home/cmd/zsh.nix
    ../../modules/home/cmd/git.nix
    ../../modules/home/cmd/zoxide.nix
    ../../modules/home/cmd/starship.nix
    ../../modules/home/cmd/nh.nix

    ../../modules/home/vscode.nix
    ../../modules/home/ghostty.nix
    ../../modules/home/stylix.nix
  ];

  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    raycast
    nixd
    ani-cli
    devenv
    gemini-cli
    notion-app
    mas
    inputs.self.packages.${system}.lncrawl
  ];

  programs.fd.enable = true;
  programs.eza.enable = true;
  programs.ripgrep.enable = true;
  programs.jq.enable = true;
  programs.fzf.enable = true;
  programs.btop.enable = true;

  home.sessionVariables = {
    ANI_CLI_DOWNLOAD_DIR = /Users/${user}/Movies;
  };

  home.activation.setWallpaper = lib.hm.dag.entryAfter ["writeBoundary"] (let 
    wallpaper = pkgs.fetchurl (builtins.elemAt (import ../../assets/wallpapers.nix) 32);
  in ''
    $DRY_RUN_CMD /usr/bin/osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"${wallpaper}\""
  '');
}