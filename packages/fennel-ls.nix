{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "fennel-ls";
  version = "2023-05-05";

  src = pkgs.fetchFromSourcehut {
    owner = "~xerool";
    repo = pname;
    rev = "8c33a46d6d6d7d1ba63aca82e6b29e35ff81be34";
    sha256 = "sha256-zcqMoto/jHtilUQjJdt0yxoe8tAFwO7bPQpEF7zKXrg=";
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
