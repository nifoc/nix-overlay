{
  description = "Collection of (useful) tools";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    neovim-flake = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bdfr-browser-flake = {
      url = "github:nifoc/bdfr-browser";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    weewx-proxy-flake = {
      url = "github:nifoc/weewx-proxy";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
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
                liblpeg = import ./packages/liblpeg-darwin.nix { inherit pkgs; };
                neovim-nightly = import ./packages/neovim-nightly.nix { inherit (inputs'.neovim-flake.packages) neovim; inherit liblpeg lib; };
                phantomjs = import ./packages/phantomjs.nix { inherit pkgs lib; };
              } else {
                neovim-nightly = import ./packages/neovim-nightly.nix { inherit (inputs'.neovim-flake.packages) neovim; inherit lib; };
              };
          in
          {
            anonymous-overflow = import ./packages/anonymous-overflow.nix { inherit pkgs lib; };
            fennel-ls = import ./packages/fennel-ls.nix { inherit pkgs lib; };
            lexical-ls = import ./packages/lexical-ls.nix { inherit pkgs lib; };
            nitter-unstable = import ./packages/nitter-unstable.nix { inherit pkgs lib; };
            q = import ./packages/q.nix { inherit pkgs lib; };
            rimgo = import ./packages/rimgo.nix { inherit pkgs lib; };
            vuetorrent = import ./packages/vuetorrent.nix { inherit pkgs lib; };

            bdfr-browser = inputs'.bdfr-browser-flake.packages.default;
            weewx-proxy = inputs'.weewx-proxy-flake.packages.default;
            website-docs-nifoc-pw = import ./packages/website-docs-nifoc-pw.nix { inherit pkgs; };
          } // darwinPackages;

        overlayAttrs = config.packages;
      };

      flake = {
        overlay = inputs.self.overlays.default;
      };
    };
}
