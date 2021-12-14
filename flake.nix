{
  description = "Collection of (useful) tools";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: {
    packages = nixpkgs.lib.genAttrs
      [
        "aarch64-darwin"
        "x86_64-darwin"
      ]
      (system: import ./packages.nix {
        inherit system;
        pkgs = nixpkgs.legacyPackages.${system};
      });

    overlay = import ./overlay.nix;
  };
}
