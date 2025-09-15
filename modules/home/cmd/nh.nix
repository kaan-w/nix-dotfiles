{ user, ... }: {
  programs.nh = {
    enable = true;
    osFlake = /home/${user}/nix-dotfiles; 
    darwinFlake = /Users/${user}/nix-dotfiles;
  };
}