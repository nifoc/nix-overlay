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
    rev = "4538221d4106e674140394c6ca9ed86f584ccdb8";
    hash = "sha256-ArfkDG5SNvhOSbx+TiBayBjViLWrKMqaaAWVnrITC9s=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
