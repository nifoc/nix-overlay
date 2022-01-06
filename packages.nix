{ system, lib, pkgs }:

{
  cliclick = import ./packages/cliclick.nix { inherit system lib pkgs; };
  proximity-sort = import ./packages/proximity-sort.nix { inherit system lib pkgs; };
}
