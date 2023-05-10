{ pkgs, otherPkgs, lib, liblpeg-darwin, ... }:

let
  inherit (pkgs.stdenv) isDarwin;
  inherit (lib) optionals;
in
otherPkgs.neovim.neovim.overrideAttrs (oa: {
  nativeBuildInputs = oa.nativeBuildInputs ++ optionals isDarwin [
    liblpeg-darwin
  ];

  patches = builtins.filter
    (p:
      let
        patch =
          if builtins.typeOf p == "set"
          then baseNameOf p.name
          else baseNameOf p;
      in
      patch != "use-the-correct-replacement-args-for-gsub-directive.patch")
    oa.patches;
})
