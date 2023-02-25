{ system, lib, pkgs }:

pkgs.nitter.overrideAttrs (
  _: {
    version = "unstable-2023-02-25";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "2751504d2f41d2fba8d4ef74a5ac413833750c00";
      hash = "sha256-hrGnXAyuFQifgcdKxj22nALzgXt/6yqEAZFGr4yPOEU=";
    };
  }
)
