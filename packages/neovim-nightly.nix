{ neovim, pkgs, lib, ... }:

let
  latest-libvterm = pkgs.libvterm-neovim;
in
neovim.override { libvterm-neovim = latest-libvterm; }
