{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "rexit";
  version = "1.2.0";

  src = pkgs.fetchurl {
    url = "https://github.com/MPult/Rexit/releases/download/v${version}/rexit-macos.zip";
    sha256 = "sha256-Xuf2bpTAIodeD4NinrFaWVNd5y/hvJjvQTYtAchBWb4=";
  };

  buildInputs = with pkgs; [ unzip ];

  unpackPhase = ''
    unzip $src
  '';

  dontStrip = true;

  installPhase = ''
    install -D rexit $out/bin/rexit
  '';

  doInstallCheck = true;

  installCheckPhase = ''
    $out/bin/rexit --version
  '';

  meta = with lib; {
    description = "This tool will export your reddit chats into a plethora of formats";
    homepage = "https://github.com/MPult/Rexit/";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" ];
  };
}
