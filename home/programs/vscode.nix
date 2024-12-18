{
  pkgs,
  inputs,
  system,
  ...
}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions;
      [
        jnoortheen.nix-ide
        pkief.material-icon-theme
        rust-lang.rust-analyzer
        golang.go
        vscodevim.vim
        mkhl.direnv
        github.vscode-github-actions
        tamasfe.even-better-toml
        unifiedjs.vscode-mdx
        astro-build.astro-vscode
        ms-python.python
      ]
      ++ [
        inputs.self.packages.${system}.vscode-moegi-theme
      ];
    userSettings = {
      "editor.minimap.enabled" = false;
      "explorer.compactFolders" = false;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "Moegi Dark Vitesse";
      "window.titleBarStyle" = "custom";
      "vim.disableExtension" = true;
      "rust-analyzer.inlayHints.parameterHints.enable" = false;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        "nixd" = {
          "formatting" = {
            "command" = ["alejandra"];
          };
          "nixpkgs" = {
            "expr" = "import <nixpkgs> {}";
          };
          "options" = {
            "nixos" = {
              "expr" = "(builtins.getFlake \"github:zaer1n/nix-dotfiles\").nixosConfigurations.nixos.options";
            };
            "home-manager" = {
              "expr" = "(builtins.getFlake \"github:zaer1n/nix-dotfiles\").homeConfigurations.zaer1n.options";
            };
          };
        };
      };
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
      };
    };
  };
}
