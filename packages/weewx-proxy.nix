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
    rev = "7fba9080b4aebb84de2f946934933963bd9fa5a6";
    sha256 = "sha256-DKQp9X0FtkURw6mFIkojn1zZnqn0zV318F6++SED8uc=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
