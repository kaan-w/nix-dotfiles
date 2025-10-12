{
  nix.settings = {
    warn-dirty = false;
    use-xdg-base-directories = true;
    experimental-features = ["nix-command flakes"];
    substituters = [
      "https://niri.cachix.org"
      "https://hyprland.cachix.org"
      "https://vicinae.cachix.org"
    ];
    trusted-public-keys = [
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };    
}