{ pkgs, lib }:

pkgs.stdenvNoCC.mkDerivation rec {
  pname = "vuetorrent";
  version = "2.26.0";

  src = pkgs.fetchurl {
    url = "https://github.com/WDaan/VueTorrent/releases/download/v${version}/vuetorrent.zip";
    sha256 = "sha256-k6uNU5WDu2p8YZ6BJFGlvGQWt9Lz5l0sroaY+iP+X8w=";
  };

  buildInputs = with pkgs; [ unzip ];

  unpackPhase = ''
    unzip $src
  '';

  dontStrip = true;

  installPhase = ''
    mkdir -p $out/share/
    cp -r vuetorrent/public/ $out/share/
  '';

  meta = with lib; {
    description = "The sleekest looking WEBUI for qBittorrent made with Vuejs!";
    homepage = "https://github.com/WDaan/VueTorrent";
    license = [ licenses.gpl3Only ];
    platforms = [
      "x86_64-darwin"
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];
  };
}
