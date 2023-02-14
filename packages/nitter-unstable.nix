{ system, lib, pkgs }:

pkgs.nitter.overrideAttrs (
  _: {
    version = "unstable-2023-02-02";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "36c72f98603e6387431224b3fb65ada765e9ab65";
      hash = "sha256-xKGfxr3GG9CiCCIq3EBeNcebOMTmeekYWJk0OhMKAxU=";
    };
  }
)
