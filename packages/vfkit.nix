{ pkgs, lib, ... }:

# Based on: https://github.com/NixOS/nixpkgs/issues/306179#issuecomment-2119521348

pkgs.stdenvNoCC.mkDerivation rec {
  pname = "vfkit";
  version = "0.5.1";

  src = pkgs.fetchurl {
    url = "https://github.com/crc-org/vfkit/releases/download/v${version}/vfkit";
    hash = "sha256-at+KsvsKO359d4VUvcSuio2ej5hM6//U4Mj/jqXwhEc=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 $src $out/bin/vfkit

    runHook postInstall
  '';

  meta = {
    description = "Simple command line tool to start VMs through virtualization framework";
    homepage = "https://github.com/crc-org/vfkit";
    license = lib.licenses.asl20;
    platforms = lib.platforms.darwin;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    mainProgram = "vfkit";
  };
}
