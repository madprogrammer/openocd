{
  description = "Rust development environment for AArch64 Android";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            pkgs.libtool
            pkgs.autoconf
            pkgs.automake
            pkgs.stdenv.cc
            pkgs.pkg-config
            pkgs.gitMinimal
          ];
          shellHook = ''
          '';
        };
      }
    );
}
