{
  description = "Collection of (useful) tools";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    neovim-flake = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    packages = nixpkgs.lib.genAttrs
      [
        "aarch64-darwin"
        "x86_64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ]
      (system: import ./packages.nix {
        inherit system;
        inherit (nixpkgs) lib;

        pkgs = nixpkgs.legacyPackages.${system};

        otherPkgs = {
          neovim = inputs.neovim-flake.packages.${system};
        };
      });

    overlay = import ./overlay.nix;
  };
}
