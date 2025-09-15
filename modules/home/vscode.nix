{
  pkgs,
  inputs,
  ...
}: {
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      pkief.material-icon-theme
      rust-lang.rust-analyzer
      golang.go
      mkhl.direnv
      github.vscode-github-actions
      tamasfe.even-better-toml
      unifiedjs.vscode-mdx
      astro-build.astro-vscode
      ms-python.vscode-pylance
      ms-vscode.cpptools-extension-pack
      bierner.github-markdown-preview
      inputs.self.packages.${pkgs.system}.vscode-moegi-theme
      inputs.self.packages.${pkgs.system}.vscode-image-preview
    ];
    profiles.default.userSettings = {
      "workbench.colorTheme" = "Moegi Dark Vitesse";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.editor.empty.hint" = "hidden";
      "update.mode" = "none";
      "editor.tabSize" = 2;
      "editor.minimap.enabled" = false;
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontLigatures" = "'calt', 'zero'"; 
      "explorer.compactFolders" = false;
      "window.titleBarStyle" = "custom";
      "markdown-preview-github-styles.colorTheme" = "light";
      "python.languageServer" = "Pylance";      
      "rust-analyzer.inlayHints.parameterHints.enable" = false;
      "gutterpreview.showImagePreviewOnGutter" = false;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings.nixd" = { 
        "formatting.command" = ["alejandra"];
        "nixpkgs.expr" = "import <nixpkgs> {}";
        "options" = {
          "nixos" = {
            "expr" = "(builtins.getFlake \"github:kaan-w/nix-dotfiles\").nixosConfigurations.nixos.options";
          };
          "nix-darwin" = {
            "expr" = "(builtins.getFlake \"github:kaan-w/nix-dotfiles\").darwinConfigurations.darwin.options";
          };
        };
      };
      "nix.hiddenLanguageServerErrors" = [
        "textDocument/definition"
      ];
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.formatOnPaste" = false;
        "editor.formatOnSave" = false;
      };
    };
  };
}
