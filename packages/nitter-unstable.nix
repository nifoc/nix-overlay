{ pkgs, lib }:

pkgs.nitter.overrideAttrs (
  oa: {
    version = "unstable-2023-08-08";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "d7ca353a55ea3440a2ec1f09155951210a374cc7";
      sha256 = "sha256-nlpUzbMkDzDk1n4X+9Wk7+qQk+KOfs5ID6euIfHBoa8=";
    };
  }
)
