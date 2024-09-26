{
  description = "Collection of (useful) tools";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";

    flake-parts.url = "github:hercules-ci/flake-parts";

    poetry2nix = {
      url = "github:nix-community/poetry2nix";
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
            inherit (pkgs) callPackage;

            poetry2nix = inputs.poetry2nix.lib.mkPoetry2Nix { inherit pkgs; };

            darwinPackages =
              if lib.hasSuffix "darwin" system then {
                cliclick = callPackage ./packages/cliclick.nix { };
                phantomjs = callPackage ./packages/phantomjs.nix { };
                tabnine = callPackage ./packages/tabnine { };
                vfkit = callPackage ./packages/vfkit.nix { };
              } else { };
          in
          {
            anonymous-overflow = callPackage ./packages/anonymous-overflow.nix { };
            bulk-downloader-for-reddit = callPackage ./packages/bulk-downloader-for-reddit.nix { };
            controld = callPackage ./packages/controld.nix { };
            discord-downloader-go = callPackage ./packages/discord-downloader-go.nix { };
            fennel-ls = callPackage ./packages/fennel-ls.nix { };
            headscale-ui = callPackage ./packages/headscale-ui.nix { };
            q = callPackage ./packages/q.nix { };
            rexit = callPackage ./packages/rexit.nix { };
            tg-archive = callPackage ./packages/tg-archive.nix { };
            vuetorrent = callPackage ./packages/vuetorrent.nix { };
            weewx = callPackage ./packages/weewx.nix { inherit poetry2nix; };
            weewx-proxy = callPackage ./packages/weewx-proxy.nix { };
          } // darwinPackages;

        overlayAttrs = config.packages;
      };

      flake = {
        overlay = inputs.self.overlays.default;
      };
    };
}
