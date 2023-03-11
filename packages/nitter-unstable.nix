{ system, lib, pkgs }:

pkgs.nitter.overrideAttrs (
  _: {
    version = "unstable-2023-03-06";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "bc219aa792cc0e4117888b2036a969559f4f2689";
      hash = "sha256-xP4b0sRa+AY3658NDlAiyc11QAKI7RbvlUsd3rR0Yyo=";
    };
  }
)
