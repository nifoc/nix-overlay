{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "slurp";
  version = "0.1.0-unstable-2025-11-03";

  src = pkgs.fetchFromGitHub {
    owner = "VyrCossont";
    repo = pname;
    rev = "6df54b388440b5aa2c1a593c7bbb1e39b7df6f26";
    hash = "sha256-VM4JwrW9aSV4inbe8x8UFDK+1d6QnxElsFnJyNosNpE=";
  };

  vendorHash = "sha256-F8JcdR9/1D441XBnxrkHJa5OEw6sFEcG6G+sCI8dMu8=";

  doCheck = false;

  meta = with lib; {
    description = "tool for exporting data from and importing data to Fediverse instances";
    homepage = "https://github.com/VyrCossont/slurp";
    license = [ licenses.agpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
