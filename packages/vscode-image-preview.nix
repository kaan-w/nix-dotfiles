{
  lib,
  vscode-utils,
}:
vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "vscode-gutter-preview";
    publisher = "kisstkondoros";
    version = "0.32.2";
    hash = "sha256-JIr4UGuwy9Z5oH8D8elGMBGP8s40pYLCEZGmJAO5Ga0=";
  };

  meta = {
    description = "Shows image preview in the gutter and on hover";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=kisstkondoros.vscode-gutter-preview";
    homepage = "https://github.com/kisstkondoros/gutter-preview";
    license = lib.licenses.mit;
  };
}