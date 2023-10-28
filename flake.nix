{
  description = "Collection of (useful) tools";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";

    flake-parts.url = "github:hercules-ci/flake-parts";

    neovim-flake = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];

      imports = [
        flake-parts.flakeModules.easyOverlay
      ];

      perSystem = { inputs', system, config, pkgs, lib, ... }: {
        packages =
          let
            darwinPackages =
              if lib.hasSuffix "darwin" system then rec {
                agilebits-op = import ./packages/agilebits-op.nix { inherit pkgs lib; };
                cliclick = import ./packages/cliclick.nix { inherit pkgs lib; };
                phantomjs = import ./packages/phantomjs.nix { inherit pkgs lib; };
              } else { };
          in
          {
            anonymous-overflow = import ./packages/anonymous-overflow.nix { inherit pkgs lib; };
            fennel-ls = import ./packages/fennel-ls.nix { inherit pkgs lib; };
            headscale-ui = import ./packages/headscale-ui.nix { inherit pkgs lib; };
            lexical = import ./packages/lexical.nix { inherit pkgs lib; };
            neovim-nightly = import ./packages/neovim-nightly.nix { inherit (inputs'.neovim-flake.packages) neovim; inherit pkgs lib; };
            nitter-unstable = import ./packages/nitter-unstable.nix { inherit pkgs lib; };
            q = import ./packages/q.nix { inherit pkgs lib; };
            rexit = import ./packages/rexit.nix { inherit pkgs lib; };
            rimgo = import ./packages/rimgo.nix { inherit pkgs lib; };
            vuetorrent = import ./packages/vuetorrent.nix { inherit pkgs lib; };

            bdfr-browser = import ./packages/bdfr-browser.nix { inherit pkgs lib; };
            weewx-proxy = import ./packages/weewx-proxy.nix { inherit pkgs lib; };
          } // darwinPackages;

        overlayAttrs = config.packages;
      };

      flake = {
        overlay = inputs.self.overlays.default;
      };
    };
}
