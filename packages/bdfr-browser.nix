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
    rev = "be98b4b1c826cac94041535746e637175ef4db05";
    sha256 = "sha256-ZKQe3CYv3+VS3xqTwnI7BHEsYMmhN91D388JPV42Tc0=";
  };

  mixNixDeps = import "${src}/mix.nix" { inherit lib beamPackages; };
}
