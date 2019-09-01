{ pkgs ? import ./pkgs.nix {} }:

with pkgs;

{
  subnetgen = stdenv.mkDerivation {
    name = "subnetgen";
    src = lib.cleanSource ./.;

    nativeBuildInputs = [ meson ninja ];
  };
}
