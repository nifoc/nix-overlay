_: super:

let custom = super.callPackage ./packages.nix { }; in

{
  inherit custom;
  inherit (custom) cliclick;
  inherit (custom) proximity-sort;
}
