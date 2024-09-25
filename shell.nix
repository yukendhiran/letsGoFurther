{ pkgs ? import <nixpkgs> {} }:

let
  nodePackages = import ./node-packages.nix { inherit pkgs; };
in pkgs.mkShell {
  buildInputs = [
    pkgs.go
    pkgs.nodejs
    pkgs.nodePackages."@angular/cli"
  ];

  shellHook = ''
    echo "Node.js, custom Angular CLI (v18.2.5), and Golang environment is ready!"
  '';
}
