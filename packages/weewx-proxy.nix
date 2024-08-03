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
    rev = "7b2129c8defde3c811c0953b5dac906343e09801";
    hash = "sha256-3P1AivFm+XHINem2a4ZDWtfS6efkQepZASD30KLXOH0=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
