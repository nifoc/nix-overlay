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
    version = "unstable-2023-05-20";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "e3b3b38a2d43a83b5fc2239ab41e864ee686fb2f";
      sha256 = "sha256-1BEZcrraPc9qOWLy3Bq8M8G5P4fUmb2IX+T+cStHpmQ=";
    };

    buildInputs = (lib.lists.remove nimPackages.karax oa.buildInputs) ++ [ karax-pkg ];
  }
)
