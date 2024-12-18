{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = let
      flake = "~/nix-dotfiles";
    in {
      nrs = "sudo nixos-rebuild switch --flake ${flake}";
      hms = "home-manager switch --flake ${flake}";
      ff = "fastfetch";
    };

    history = {
      size = 5000;
      ignoreAllDups = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
  };
}
