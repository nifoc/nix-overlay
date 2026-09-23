{ pkgs, lib }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "torrent-best-blocklist";
  version = "1.1.5-unstable-2026-09-22";

  src = pkgs.fetchFromGitHub {
    owner = "waelisa";
    repo = "Best-blocklist";
    rev = "c79d5e562f20b3017df8eb66e47283de1239844d";
    hash = "sha256-WuYMQFGCaqOVteM5t4N+pXXuqv6gCBS2DYWy8irUQbM=";
  };

  buildInputs = with pkgs; [ unzip ];

  unpackPhase = ''
    unzip $src/wael.list.p2p.zip
  '';

  dontStrip = true;

  installPhase = ''
    mkdir -p $out/share/
    cp wael.list.p2p $out/share/list.p2p
  '';

  meta = with lib; {
    description = "Torrent software blocklist.";
    homepage = "https://github.com/waelisa/Best-blocklist";
    license = [ licenses.gpl3Only ];
    platforms = [
      "x86_64-darwin"
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];
  };
}
