{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShellNoCC {
  packages = with pkgs; [
    bun
    dprint
  ];

  DPRINT = pkgs.dprint + "/bin/dprint";
}
