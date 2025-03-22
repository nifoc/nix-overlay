{ pkgs, lib, ... }:

let
  erlang = pkgs.beam_nox.interpreters.erlang_26;
  beamPackages = pkgs.beam_nox.packagesWith erlang;
in
beamPackages.mixRelease rec {
  pname = "weewx-proxy";
  version = "0.0.1";

  src = pkgs.fetchFromGitea {
    domain = "git.kempkens.io";
    owner = "daniel";
    repo = pname;
    rev = "e41b7528e2edec671271f99dd176cdbc1f2802ea";
    hash = "sha256-XLpHfVoH/B2Sd1Ndr6055MuD/l3Dg7L9J8s0lrjUhlc=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
