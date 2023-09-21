{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "headscale-ui";
  version = "2023.01.30-beta-1";

  src = pkgs.fetchurl {
    url = "https://github.com/gurucomputing/${pname}/releases/download/${version}/headscale-ui.zip";
    sha256 = "sha256-6SUgtSTFvJWNdsWz6AiOfUM9p33+8EhDwyqHX7O2+NQ=";
  };

  buildInputs = with pkgs; [ unzip ];

  unpackPhase = ''
    unzip $src
  '';

  dontStrip = true;

  installPhase = ''
    mkdir -p $out/share/
    cp -r web/ $out/share/
  '';

  meta = with lib; {
    description = "A web frontend for the headscale Tailscale-compatible coordination server";
    homepage = "https://github.com/gurucomputing/headscale-ui";
    license = [ licenses.bsd3 ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
