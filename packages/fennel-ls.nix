{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "fennel-ls";
  version = "2023-06-29";

  src = pkgs.fetchFromSourcehut {
    owner = "~xerool";
    repo = pname;
    rev = "21bd635123273141581098eb2501e9ee946e53b0";
    sha256 = "sha256-RVKD+otCFXCIjJWIe5fn68OzuKz4NhCJRQuQfXYrioI=";
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
