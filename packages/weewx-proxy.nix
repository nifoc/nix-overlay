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
    rev = "b72605185b179d44f2b18a1615c3938c2ce64d3e";
    hash = "sha256-46lb1J0H+vDK+5yDy1Tm8XxjIiM20UQYb5+oOBjERww=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
