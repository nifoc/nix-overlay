{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "website-docs-nifoc-pw";
  version = "2021-08-30";

  src = pkgs.fetchFromGitHub {
    owner = "nifoc";
    repo = "nifoc.pw-docs";
    rev = "24034da912e3d7fddc447734ca4c9a5951a0fa32";
    sha256 = "sha256-GwVwbLUbxpFidOU1CTHFbYs/MscHpsqiYmnyvLtnYjM=";
    fetchSubmodules = false;
  };

  installPhase = ''
    mkdir $out
    mv site $out/
  '';

  meta = {
    description = "Static documentation files for some older projects";
    homepage = "https://github.com/nifoc/nifoc.pw-docs";
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
