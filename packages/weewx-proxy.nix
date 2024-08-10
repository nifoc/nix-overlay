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
    rev = "107e7d0b5abc48975b76f0a21c290b2ed032ec5a";
    hash = "sha256-D3j5xEoPUBRYKxUR9Fs0FFWE1rEk0lGt5fMsBeVXd0M=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
