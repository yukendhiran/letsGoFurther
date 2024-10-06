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
          ];

         shellHook = ''
          echo "Node.js version: ${pkgs.nodejs.version}"
          echo "Angular CLI version: ${pkgs.nodePackages."@angular/cli".version}"
          echo "Go version: ${pkgs.go.version}"
       
        '';
        };

       
    });
}