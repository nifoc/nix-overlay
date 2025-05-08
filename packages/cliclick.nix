{
  stdenv,
  fetchFromGitHub,
  lib,
  # Dependencies
  perl,
  apple-sdk_14,
}:

stdenv.mkDerivation rec {
  pname = "cliclick";
  version = "5.1";

  src = fetchFromGitHub {
    owner = "BlueM";
    repo = pname;
    rev = version;
    sha256 = "sha256-8lWfeRPCF2zn9U79uZkhlj0izGSueTZuYpJx1LgsyfQ=";
    fetchSubmodules = false;
  };

  NIX_CFLAGS_COMPILE = "-include cliclick_Prefix.pch -I Actions -I .";

  buildInputs = [
    perl
    apple-sdk_14
  ];

  dontStrip = true;

  installPhase = ''
    mkdir -p $out/bin
    cp cliclick $out/bin
  '';

  doInstallCheck = true;

  installCheckPhase = ''
    $out/bin/cliclick -V
  '';

  meta = {
    description = "macOS CLI tool for emulating mouse and keyboard events";
    homepage = "https://github.com/BlueM/cliclick";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.darwin;
  };
}
