{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "fennel-ls";
  version = "2023-09-18";

  src = pkgs.fetchFromSourcehut {
    owner = "~xerool";
    repo = pname;
    rev = "824525573a6299c232a0b910a960bd59a563904f";
    sha256 = "sha256-qgHPXfIiIMw/hXkINgqv/OJb81TheiBBktuqrpJ+Z6s=";
    fetchSubmodules = false;
  };

  buildInputs = with pkgs; [
    luajit
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
