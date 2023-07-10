{ pkgs, lib }:

pkgs.nitter.overrideAttrs (
  oa: {
    version = "unstable-2023-07-10";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "0bc3c153d9b38a3c02f321fb64a375fef6b97e8e";
      sha256 = "sha256-msx14FZl2uRZvZjTlF7c3Va742HhiU6R2jdh4neIEV4=";
    };
  }
)
