{ pkgs, lib }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "torrent-best-blocklist";
  version = "0-unstable-2025-05-28";

  src = pkgs.fetchFromGitHub {
    owner = "waelisa";
    repo = "Best-blocklist";
    rev = "23edea2a9b549ca2debdc933ef80094e204aae00";
    hash = "sha256-t0zZZzu7w9gnsG/Bn0xH0oClk983XD5LDR/ZeoLUSqE=";
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
