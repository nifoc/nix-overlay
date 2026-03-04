{ pkgs, lib }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "torrent-best-blocklist";
  version = "1.1.4-unstable-2026-02-22";

  src = pkgs.fetchFromGitHub {
    owner = "waelisa";
    repo = "Best-blocklist";
    rev = "24bb766c5a826ab5107cf164bef4273317612477";
    hash = "sha256-abkMPlOfndk6Xdwjsk1a0zLE9C1SWEssM8t9NA71esw=";
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
