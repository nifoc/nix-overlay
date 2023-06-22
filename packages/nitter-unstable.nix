{ pkgs, lib }:

pkgs.nitter.overrideAttrs (
  oa: {
    version = "unstable-2023-05-30";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "38985af6ed30f050201b15425cdac0dc2e286b6d";
      sha256 = "sha256-YPwApMCsra/T5EzCup28/4FaOrhEuw3MBiitv+LTbi0=";
    };
  }
)
