{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    naersk = {
      url = "github:nix-community/naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, flake-utils, naersk, git-hooks, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        naersk-lib = pkgs.callPackage naersk {};
      in {
        packages.default = naersk-lib.buildPackage {
          src = ./.;
        };

        checks.pre-commit = git-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            clippy.enable = true;
            clippy.settings.denyWarnings = true;
            rustfmt.enable = true;
          };
        };

       formatter = pkgs.writeShellApplication {
          name = "pre-commit-run";
          text = ''
            ${self.checks.${system}.pre-commit.config.package}/bin/pre-commit run --all-files
          '';
        };

        devShells.default = let
          inherit (self.checks.${system}.pre-commit) shellHook enabledPackages;
        in pkgs.mkShell {
          inherit shellHook;
          buildInputs = with pkgs; [ rustc cargo ] ++ enabledPackages;
          env.RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
        };
      }
    );
}
