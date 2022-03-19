{ system, lib, pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "agilebits-op";
  version = "2.0.0";

  src = pkgs.fetchurl {
    url = "https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/op_apple_universal_v${version}.pkg";
    sha256 = "DC9hdzRjQ9iNjbe6PfRpMXzDeInq4rYSAa2nDHQMTRo=";
  };

  buildInputs = with pkgs; [ xar cpio ];

  unpackPhase = ''
    xar -xf $src
    zcat op.pkg/Payload | cpio -i
  '';

  dontStrip = true;

  installPhase = ''
    install -D op $out/bin/op
  '';

  doInstallCheck = true;

  installCheckPhase = ''
    $out/bin/op --version
  '';

  meta = with lib; {
    description = "1Password command-line tool";
    homepage = "https://developer.1password.com/docs/cli";
    license = licenses.unfree;
    platforms = [ "x86_64-darwin" "aarch64-darwin" ];
  };
}
