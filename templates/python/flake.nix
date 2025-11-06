{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { pkgs, ... }: {
        devShells.default = pkgs.mkShellNoCC {
          buildInputs = with pkgs; [
            python3
            # (pkgs.python3.withPackages (pp: with pp; [ ]))
          ];
        };
      };
    };
}