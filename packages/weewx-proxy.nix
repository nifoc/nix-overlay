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
    rev = "495723fb32293f68e7fa9dc9dd9b37ed21a70fdb";
    sha256 = "sha256-QwLOvH2rzky9ZN6ssni2jwHpUgdi5LJRu6n8e0AJsw8=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
