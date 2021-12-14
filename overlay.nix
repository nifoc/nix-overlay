_: super:

let custom = super.callPackage ./packages.nix { }; in

{
  inherit custom;
  cliclick = custom.cliclick;
}
