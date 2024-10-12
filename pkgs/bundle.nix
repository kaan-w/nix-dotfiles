{ pkgs, ... }: {
  vscode-moegi-theme = pkgs.callPackage ./vscode-moegi-theme.nix {};
  # https://github.com/ryze312/stackpkgs/blob/main/packages/audiorelay.nix
  audiorelay = pkgs.callPackage ./audiorelay.nix {};
} 