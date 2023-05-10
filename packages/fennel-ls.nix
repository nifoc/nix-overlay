{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "fennel-ls";
  version = "2023-02-14";

  src = pkgs.fetchFromSourcehut {
    owner = "~xerool";
    repo = pname;
    rev = "main";
    hash = "sha256-S/TDZcGvI2LgK7gjMWGr/yNK+9TDJhxCDR2Jja5jscU=";
    fetchSubmodules = false;
  };

  buildInputs = with pkgs; [
    lua
  ];

  buildPhase = ''
    patchShebangs fennel
    make
  '';

  dontStrip = true;

  installPhase = ''
    mkdir -p $out/bin
    cp fennel-ls $out/bin
  '';

  meta = with lib; {
    description = "A language server for fennel";
    homepage = "https://git.sr.ht/~xerool/fennel-ls";
    license = licenses.mit;
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
