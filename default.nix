{ pkgs ? import ./pkgs.nix {} }:

with pkgs;

stdenv.mkDerivation {
  name = "subnetgen";
  src = lib.cleanSource ./.;

  nativeBuildInputs = [ meson ninja ];
}
