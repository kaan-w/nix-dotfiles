{
  lib,
  vscode-utils,
}:
vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "vscode-pdf";
    publisher = "mathematic";
    version = "0.1.6";
    hash = "sha256-vJvINGtAAhXPMC4VOg99vNSf9izu2hNG+M4t3iYEJUU=";
  };

  meta = {
    description = "Portable document format (PDF) viewer for Visual Studio Code.";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=mathematic.vscode-pdf";
    homepage = "https://github.com/mathematic-inc/vscode-pdf";
    license = lib.licenses.asl20;
  };
}