{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "vuetorrent";
  version = "1.6.0";

  src = pkgs.fetchurl {
    url = "https://github.com/WDaan/VueTorrent/releases/download/v${version}/vuetorrent.zip";
    sha256 = "sha256-+Hyh+tQWVXDdQDIU5fdAZIXdUvQN8v1NLXzU9+yNRmI=";
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
    description = "The sleekest looking WEBUI for qBittorrent made with Vuejs! ";
    homepage = "https://github.com/WDaan/VueTorrent";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
