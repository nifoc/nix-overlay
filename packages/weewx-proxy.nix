{ pkgs, lib, ... }:

let
  erlang = pkgs.beam_nox.interpreters.erlangR26;
  beamPackages = pkgs.beam_nox.packagesWith erlang;
in
beamPackages.mixRelease rec {
  pname = "weewx-proxy";
  version = "0.0.1";

  src = pkgs.fetchFromGitea {
    domain = "git.kempkens.io";
    owner = "daniel";
    repo = pname;
    rev = "2ad93b457ccda286185e8e64a284589111f48768";
    sha256 = "sha256-cMsz+72xSnJhPRGbrVrJWF4dJlyuFImc6JLBZw3lDIM=";
  };

  mixNixDeps = import "${src}/mix.nix" { inherit lib beamPackages; };
}
