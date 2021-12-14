{ system, pkgs }:

{
  cliclick = import ./packages/cliclick.nix { inherit system pkgs; };
}
