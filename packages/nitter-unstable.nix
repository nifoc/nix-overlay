{ pkgs, lib }:

pkgs.nitter.overrideAttrs (
  oa: {
    version = "unstable-2023-07-14";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "f881226b223f1650f7f1621991baa38513ddb61f";
      sha256 = "sha256-5QV17pV8VS/eB+SUpQZIlTS87iQ+rTbqMLHgFyn/AFk=";
    };
  }
)
