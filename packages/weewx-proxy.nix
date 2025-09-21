{ pkgs, lib, beamPackages, ... }:

beamPackages.mixRelease rec {
  pname = "weewx-proxy";
  version = "0-unstable-2025-09-22";

  src = pkgs.fetchFromGitea {
    domain = "git.kempkens.io";
    owner = "daniel";
    repo = pname;
    rev = "230e024653d140c5808fb9ab8bb62a900a0b5c29";
    hash = "sha256-tWbqg0+lh7luRlAXb+ggua3s4QEu7MY7Zl6kuUxdx48=";
  };

  mixNixDeps = import "${src}/deps.nix" { inherit lib beamPackages; };
}
