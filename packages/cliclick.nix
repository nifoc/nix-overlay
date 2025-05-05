{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "cliclick";
  version = "5.1";

  src = pkgs.fetchFromGitHub {
    owner = "BlueM";
    repo = pname;
    rev = version;
    sha256 = "sha256-8lWfeRPCF2zn9U79uZkhlj0izGSueTZuYpJx1LgsyfQ=";
    fetchSubmodules = false;
  };

  NIX_CFLAGS_COMPILE = "-include cliclick_Prefix.pch -I Actions -I .";

  buildInputs =
    (with pkgs; [
      perl
    ])
    ++ (with pkgs.darwin.apple_sdk.frameworks; [
      Carbon
      Cocoa
      Foundation
      IOKit
    ]);

  dontStrip = true;

  installPhase = ''
    mkdir -p $out/bin
    cp cliclick $out/bin
  '';

  doInstallCheck = true;

  installCheckPhase = ''
    $out/bin/cliclick -V
  '';

  meta = with lib; {
    description = "macOS CLI tool for emulating mouse and keyboard events";
    homepage = "https://github.com/BlueM/cliclick";
    license = licenses.bsd3;
    platforms = lib.platforms.darwin;
  };
}
