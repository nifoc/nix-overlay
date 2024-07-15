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
    rev = "2350a7859d05b84f270c0fde33bada8f8a09fb1c";
    sha256 = "sha256-/Wm+nrFslO2vXJc+tH6d2SC9pCVjss4J0x/nXR5T4+0=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
