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
    rev = "f629f4a01968eb69b511ae3d1432be22a1685438";
    hash = "sha256-NjRkgEeihX6CXSAnIM2HnnokMOeEVfkJjPEexoQ6ssU=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
