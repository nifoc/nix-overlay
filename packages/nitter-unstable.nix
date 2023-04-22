{ system, lib, pkgs }:

pkgs.nitter.overrideAttrs (
  _: {
    version = "unstable-2023-03-06";

    src = pkgs.fetchFromGitHub {
      owner = "zedeus";
      repo = "nitter";
      rev = "2254a0728c587ebcec51ff08da0bf145606a629e";
      hash = "sha256-d4KYBCcYbfvEtOqa1umcXmYsBRvhLgpHVoCUfY0XdXI=";
    };
  }
)
