{ system, lib, pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "fennel-ls";
  version = "2022-11-11";

  src = pkgs.fetchFromSourcehut {
    owner = "~xerool";
    repo = pname;
    rev = "main";
    sha256 = "sha256-mYOAlSCixlWzykPeLcGyTzWksDAJjblkYwI0k1GuYvE=";
    fetchSubmodules = false;
  };

  buildInputs = with pkgs; [
    lua
  ];

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
