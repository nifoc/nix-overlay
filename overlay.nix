_: super:

let
  custom = super.callPackage ./packages.nix { };
in
{
  inherit (custom) agilebits-op;
  inherit (custom) cliclick;
  inherit (custom) luarocks-jsregexp;
  inherit (custom) phantomjs;
  inherit (custom) q;
}
