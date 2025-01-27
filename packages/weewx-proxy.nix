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
    rev = "3a3e8e277a8039cae7d0bb786f09b49e9a99a2f1";
    hash = "sha256-NWm5wzWoht2M5x4MoVTeJNYkAnohNMazXL8QtJhX8P0=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
