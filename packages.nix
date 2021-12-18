{ system, lib, pkgs }:

{
  cliclick = import ./packages/cliclick.nix { inherit system lib pkgs; };
}
