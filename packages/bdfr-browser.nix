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
    rev = "d7bf17fa347654c8f2bdd1ef37dbb60fe6d122cd";
    hash = "sha256-5RrvzVw3udDX256MxG+7bDWTAAXoHra7PoBeAd1oDdY=";
  };

  mixNixDeps = import "${src}/mix.nix" { inherit lib beamPackages; };

  meta = with lib; {
    description = "Bulk Downloader for Reddit Web UI";
    homepage = "https://git.kempkens.io/daniel/bdfr-browser";
    license = [ licenses.isc ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
