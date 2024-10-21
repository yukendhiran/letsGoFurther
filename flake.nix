{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShell = with pkgs;
        mkShell {
          buildInputs = [
            nodejs
            nodePackages."@angular/cli"
            go
            go-migrate
          ];

         shellHook = ''
          echo "=================================================="
          echo "Node.js version: ${pkgs.nodejs.version}"
          echo "=================================================="

          echo "Angular CLI version: ${pkgs.nodePackages."@angular/cli".version}"
          echo "=================================================="

          echo "Go version: ${pkgs.go.version}"
          echo "  |- go-migrate: ${pkgs.go-migrate.version}"
          echo "=================================================="

          export GREENLIGHT_DB_DSN='postgres://greenlight:pa55word@localhost/greenlight?sslmode=disable'
          echo "DB DNS String: $GREENLIGHT_DB_DSN"
          echo "=================================================="

        '';
        };

       
    });
}