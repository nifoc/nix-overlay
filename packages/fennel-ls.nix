{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "fennel-ls";
  version = "2023-07-20";

  src = pkgs.fetchFromSourcehut {
    owner = "~xerool";
    repo = pname;
    rev = "e7c642e12a15c6d452559414ee1890b30f4e8406";
    sha256 = "00afmrkd7hszh91axva6vgp15jxsgvfazgign26r8b48cwdf1x64";
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
