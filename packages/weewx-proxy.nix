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
    rev = "1e839fd76690564b197668b86c28c485c9543f68";
    sha256 = "sha256-UtAf0oxD99FTxyheHYl7Qi/TgNJ9zi4fM7o1pJohGeQ=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
