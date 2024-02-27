{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "agilebits-op";
  version = "2.25.0";

  src = pkgs.fetchurl {
    url = "https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/op_apple_universal_v${version}.pkg";
    hash = "sha256-JO7Hh8PUnW5D3GCJFPcVfIYXzHV6HkckqFnGK9vH7Qs=";
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
    #license = licenses.unfree;
    platforms = [ "x86_64-darwin" "aarch64-darwin" ];
  };
}
