{ system, lib, pkgs }:

{
  agilebits-op = import ./packages/agilebits-op.nix { inherit system lib pkgs; };
  anonymous-overflow = import ./packages/anonymous-overflow.nix { inherit system lib pkgs; };
  cliclick = import ./packages/cliclick.nix { inherit system lib pkgs; };
  fennel-ls = import ./packages/fennel-ls.nix { inherit system lib pkgs; };
  luarocks-jsregexp = import ./packages/luarocks-jsregexp.nix { inherit system lib pkgs; };
  nitter-unstable = import ./packages/nitter-unstable.nix { inherit system lib pkgs; };
  phantomjs = import ./packages/phantomjs.nix { inherit system lib pkgs; };
  q = import ./packages/q.nix { inherit system lib pkgs; };
  rimgo = import ./packages/rimgo.nix { inherit system lib pkgs; };
  website-docs-nifoc-pw = import ./packages/website-docs-nifoc-pw.nix { inherit system lib pkgs; };
}
