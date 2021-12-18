{ system, lib, pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "cliclick";
  version = "5.0.1";

  src = pkgs.fetchFromGitHub {
    owner = "BlueM";
    repo = "cliclick";
    rev = "79a49ff25f550fda5b2a1806366aa9d7facc46f3";
    sha256 = "Wj1niLXCwBYTsXB2Qkdvs85BJD7uRqGIerCTjhS20ZQ=";
    fetchSubmodules = false;
  };

  NIX_CFLAGS_COMPILE = "-include cliclick_Prefix.pch -I Actions -I .";

  buildInputs = (with pkgs; [
    perl
  ]) ++ (with pkgs.darwin.apple_sdk.frameworks; [
    Carbon
    Cocoa
    Foundation
    IOKit
  ]);

  installPhase = ''
    mkdir -p $out/bin
    cp cliclick $out/bin
  '';

  meta = with lib; {
    description = "macOS CLI tool for emulating mouse and keyboard events";
    homepage = "https://github.com/BlueM/cliclick";
    license = licenses.bsd3;
    platforms = [ "x86_64-darwin" "aarch64-darwin" ];
  };
}
