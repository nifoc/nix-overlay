{ neovim, pkgs, lib, ... }:

let
  latest-libvterm = pkgs.libvterm-neovim.overrideAttrs (_: rec {
  version = "0.3.3";

    src = pkgs.fetchurl {
      url = "https://github.com/neovim/libvterm/archive/v${version}.tar.gz";
      sha256 = "0babe3ab42c354925dadede90d352f054aa9c4ae6842ea803a20c9741e172e56";
    };
  });
in
neovim.override { libvterm-neovim = latest-libvterm; }
