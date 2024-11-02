{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = let 
      flakeDir = "~/nix-dotfiles"; 
    in {
      nrs = "sudo nixos-rebuild switch --flake ${flakeDir}";
      hms = "home-manager switch --flake ${flakeDir}";
      ff = "fastfetch";
    };

    history = {
      size = 5000;
      ignoreAllDups = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
  };
}