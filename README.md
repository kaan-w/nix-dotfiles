# ❄️ nix-dotfiles
  
![NixOS](https://img.shields.io/badge/NixOS-2a2630.svg?style=flat&logo=nixos&logoColor=%23CAD3F5)
![MacOS](https://img.shields.io/badge/MacOS-2a2630?style=flat&logo=apple&logoColor=CAD3F5)
![nixpkgs](https://img.shields.io/badge/nixpkgs-unstable-informational?style=flat&logo=nixos&logoColor=%23CAD3F5&labelColor=%232a2630&color=%2346397f)

## Installation
<details open>
<summary><strong>NixOS</strong></summary>
  
```sh
nix-shell -p git
git clone https://github.com/kaan-w/nix-dotfiles.git
sudo nixos-rebuild switch --flake ./nix-dotfiles
```
</details>
<details open>
<summary><strong>MacOS</strong></summary>
  
```sh
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
xcode-select --install
softwareupdate --install-rosetta --agree-to-license
git clone https://github.com/kaan-w/nix-dotfiles.git
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake ./nix-dotfiles
```
</details>

## Packages
Running the packages directly:
```sh
nix run github:kaan-w/nixdotfiles#<name>
```
Using the packages from the flake outputs:
1. Add this flake to your inputs:
```nix
inputs = {
  kaanw-dotfiles = {
    url = "github:kaan-w/nix-dotfiles";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};
```
2. Use the packages:
```nix
{ inputs, ... }: {
  environment.systemPackages = [
    inputs.kaanw-dotfiles.packages.<system>.<name>
  ];
}
```

## Templates
Devshell templates for `rust`, `python`, `zig` are available. Initializing one of these templates:
```sh
nix flake init -t github:kaan-w/nix-dotfiles#<name>
```
