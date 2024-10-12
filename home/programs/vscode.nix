{ pkgs, inputs, system, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      pkief.material-icon-theme
    ] ++ [
      inputs.self.packages.${system}.vscode-moegi-theme
    ];
    userSettings = {
      "editor.minimap.enabled" = false;
      "explorer.compactFolders" = false;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "Moegi Dark Vitesse";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings" = {
        "nil" = {
          "diagnostics" = {
            "ignored" = [ "unused_binding" "unused_with" ];
          };
        };
      };
    };
  };
}