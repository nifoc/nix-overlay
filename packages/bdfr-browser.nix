{ pkgs, lib, ... }:

let
  erlang = pkgs.beam.interpreters.erlangR26;
  beamPackagesPrev = pkgs.beam.packagesWith erlang;
  elixir = beamPackagesPrev.elixir_1_15;

  beamPackages = beamPackagesPrev // rec {
    inherit erlang elixir;
    hex = beamPackagesPrev.hex.override { inherit elixir; };
    buildMix = beamPackagesPrev.buildMix.override { inherit elixir erlang hex; };
    mixRelease = beamPackagesPrev.mixRelease.override { inherit erlang elixir; };
  };
in
beamPackages.mixRelease rec {
  pname = "bdfr-browser";
  version = "0.0.1";

  src = pkgs.fetchFromGitea {
    domain = "git.kempkens.io";
    owner = "daniel";
    repo = pname;
    rev = "52613685143a7f0cf14e4ca9e444e29963eebdf7";
    hash = "sha256-9/UWyc/anhV0DaGxM59tsbzm6WP0sxx308Cgl4OyIEY=";
  };

  mixNixDeps = import "${src}/mix.nix" { inherit lib beamPackages; };

  meta = with lib; {
    description = "Bulk Downloader for Reddit Web UI";
    homepage = "https://git.kempkens.io/daniel/bdfr-browser";
    license = [ licenses.isc ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
