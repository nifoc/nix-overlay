{ pkgs, lib }:

pkgs.nitter.overrideAttrs (
  oa: {
    version = "unstable-2023-07-22";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "72d8f35cd1ec1205824711a41dab4b8d7a6b298a";
      sha256 = "04q371r487zm97nm0nxm0wydhdy0jd0n91w6ykl3wqax2q1z6a0j";
    };
  }
)
