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
    rev = "c5e58816db52e4b1235472d6bf28e74c60097fcb";
    hash = "sha256-4kwTvdy7IYtWSXMIvgmdRyPzSWhAY8AqA2s7XlScFH4=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
