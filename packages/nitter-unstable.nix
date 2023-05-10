{ pkgs, lib }:

let
  nimPackages = pkgs.nimPackages;

  karax-pkg = pkgs.fetchFromGitHub {
    owner = "karaxnim";
    repo = "karax";
    rev = "5cf360c";
    sha256 = "sha256-TPwQSqi7ciR6QMklWi/bOJnyzCAT1lZyxW4DTiWTALo=";
  };
in
pkgs.nitter.overrideAttrs (
  oa: {
    version = "unstable-2023-04-21";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "bc219aa792cc0e4117888b2036a969559f4f2689";
      hash = "sha256-xP4b0sRa+AY3658NDlAiyc11QAKI7RbvlUsd3rR0Yyo=";
    };

    buildInputs = (lib.lists.remove nimPackages.karax oa.buildInputs) ++ [ karax-pkg ];
  }
)
