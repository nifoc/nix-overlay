_: super:

let
  custom = super.callPackage ./packages.nix { };
in
{
  inherit (custom) agilebits-op;
  inherit (custom) anonymous-overflow;
  inherit (custom) cliclick;
  inherit (custom) fennel-ls;
  inherit (custom) luarocks-jsregexp;
  inherit (custom) nitter-unstable;
  inherit (custom) phantomjs;
  inherit (custom) q;
  inherit (custom) website-docs-nifoc-pw;
  inherit (custom) wezterm-unstable;
}
