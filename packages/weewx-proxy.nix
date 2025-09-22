{ pkgs, lib, beamPackages, ... }:

beamPackages.mixRelease rec {
  pname = "weewx-proxy";
  version = "0-unstable-2025-09-22";

  src = pkgs.fetchFromGitea {
    domain = "git.kempkens.io";
    owner = "daniel";
    repo = pname;
    rev = "305c95abe1d3b4c39b69cc36f4ea5cc717d533c1";
    hash = "sha256-TBMcplcnxlX6ocmo9ZcgvFlnyEIgFE+BO90kbsXBoyg=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
