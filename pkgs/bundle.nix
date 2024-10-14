{ pkgs, ... }: {
  vscode-moegi-theme = pkgs.callPackage ./vscode-moegi-theme.nix {};
  # https://github.com/ryze312/stackpkgs/blob/main/packages/audiorelay.nix
  audiorelay = pkgs.callPackage ./audiorelay.nix {};
  # https://github.com/NixOS/nixpkgs/pull/348336/files
  linux-wallpaperengine = pkgs.callPackage ./linux-wallpaperengine.nix {};
} 