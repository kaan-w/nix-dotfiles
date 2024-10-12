{ lib, vscode-utils }:
vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "moegi-theme";
    publisher = "ddiu8081";
    version = "0.7.1";
    hash = "sha256-hSApAG5pYAooQipqfUruRulRPoWu5Br8PbgFF3P1OWk=";
  };

  meta = {
    changelog = "https://marketplace.visualstudio.com/items/ddiu8081.moegi-theme/changelog";
    description = "An elegant theme for VS Code";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=ddiu8081.moegi-theme";
    homepage = "https://github.com/moegi-design/vscode-theme";
    license = lib.licenses.mit;
  };
}
