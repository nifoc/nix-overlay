{ system, lib, pkgs }:

{
  agilebits-op = import ./packages/agilebits-op.nix { inherit system lib pkgs; };
  cliclick = import ./packages/cliclick.nix { inherit system lib pkgs; };
  luarocks-jsregexp = import ./packages/luarocks-jsregexp.nix { inherit system lib pkgs; };
  phantomjs = import ./packages/phantomjs.nix { inherit system lib pkgs; };
  q = import ./packages/q.nix { inherit system lib pkgs; };
}
