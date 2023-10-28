{ neovim, pkgs, lib, ... }:

let
  latest-libvterm = pkgs.libvterm-neovim.overrideAttrs (_: rec {
  version = "0.3.3";

    src = pkgs.fetchurl {
      url = "https://github.com/neovim/deps/raw/12c9dcf1d823ac4acbccf494c93c4774a87db11d/opt/libvterm-${version}.tar.gz";
      sha256 = "09156f43dd2128bd347cbeebe50d9a571d32c64e0cf18d211197946aff7226e0";
    };
  });
in
neovim.override { libvterm-neovim = latest-libvterm; }
