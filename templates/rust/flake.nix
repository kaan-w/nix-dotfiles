{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    naersk = {
      url = "github:nix-community/naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { pkgs, ... }: let
        naersk-lib = pkgs.callPackage inputs.naersk {};
      in {
        packages = naersk-lib.buildPackage {
          src = ./.;
        };

        devShells.default = pkgs.mkShellNoCC {
          buildInputs = with pkgs; [
            rustc 
            cargo
            rustfmt
            clippy
          ];
          
          env.RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
        };
      };
    };
}

