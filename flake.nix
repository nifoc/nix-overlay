{
  description = "Collection of (useful) tools";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";

    flake-parts.url = "github:hercules-ci/flake-parts";
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

            darwinPackages =
              if lib.hasSuffix "darwin" system then {
                aerospace = callPackage ./packages/aerospace.nix { };
                cliclick = callPackage ./packages/cliclick.nix { };
                phantomjs = callPackage ./packages/phantomjs.nix { };
                tabnine = callPackage ./packages/tabnine { };
              } else { };
          in
          {
            anonymous-overflow = callPackage ./packages/anonymous-overflow.nix { };
            bulk-downloader-for-reddit = callPackage ./packages/bulk-downloader-for-reddit.nix { };
            discord-downloader-go = callPackage ./packages/discord-downloader-go.nix { };
            fennel-ls = callPackage ./packages/fennel-ls.nix { };
            headscale-ui = callPackage ./packages/headscale-ui.nix { };
            lexical = callPackage ./packages/lexical.nix { };
            q = callPackage ./packages/q.nix { };
            redlib = callPackage ./packages/redlib.nix { };
            rexit = callPackage ./packages/rexit.nix { };
            tg-archive = callPackage ./packages/tg-archive.nix { };
            vuetorrent = callPackage ./packages/vuetorrent.nix { };
            weewx-proxy = callPackage ./packages/weewx-proxy.nix { };
          } // darwinPackages;

        overlayAttrs = config.packages;
      };

      flake = {
        overlay = inputs.self.overlays.default;
      };
    };
}
