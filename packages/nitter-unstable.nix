{ system, lib, pkgs }:

pkgs.nitter.overrideAttrs (
  _: {
    version = "unstable-2023-03-04";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "725f601c9b006cd774024464caf4529068eb17a9";
      hash = "sha256-S4Tyq4PbXDz5lpSFOIIB5pd6oEPkmxmuk3vcHGm0xZY=";
    };
  }
)
