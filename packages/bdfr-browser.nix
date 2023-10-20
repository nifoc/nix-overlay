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
    rev = "65f8468daaa80e5e2127f2b5c1c2fe937fb0fcb4";
    hash = "sha256-XKZuCFuTXkgtbtbczjhb1Zf6Iyf4WL9FLNfsURvxWQQ=";
  };

  mixNixDeps = import "${src}/mix.nix" { inherit lib beamPackages; };

  meta = with lib; {
    description = "Bulk Downloader for Reddit Web UI";
    homepage = "https://git.kempkens.io/daniel/bdfr-browser";
    license = [ licenses.isc ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
