{ pkgs, lib }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "torrent-best-blocklist";
  version = "1.1.4-unstable-2026-08-02";

  src = pkgs.fetchFromGitHub {
    owner = "waelisa";
    repo = "Best-blocklist";
    rev = "052c3e563b89a8fca193e4ee0d9ba1b52a673d51";
    hash = "sha256-BwxAHykG0FcKYXXLh0D7wc73RD9SPq0a+Rb4uxMMvUc=";
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
