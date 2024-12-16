{ pkgs, ... }: {
  stylix = {
    enable = true;
    image = pkgs.fetchurl (builtins.elemAt (import ../wallpapers.nix) 3);
    polarity = "dark";
    cursor = {
      name = "Bibata-Modern-Ice";
	  	package = pkgs.bibata-cursors;
	  	size = 24;
    };
    targets = {
      vscode.enable = false;
      vesktop.enable = false;
    };    
  };  
}