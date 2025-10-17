{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    zig.url = "github:mitchellh/zig-overlay";
  };

  outputs = { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { pkgs, inputs', ... }: {
        devShells.default = pkgs.mkShellNoCC {
          buildInputs = [
            inputs'.zig.packages.master
            pkgs.zls
          ];
        };
      };
    };
}