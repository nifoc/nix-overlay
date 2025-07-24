{ pkgs, lib }:

pkgs.stdenvNoCC.mkDerivation {
  pname = "torrent-best-blocklist";
  version = "0-unstable-2025-07-23";

  src = pkgs.fetchFromGitHub {
    owner = "waelisa";
    repo = "Best-blocklist";
    rev = "c584b94cbee306ea9988b59824a54afb4ba88572";
    hash = "sha256-XuUDks9EE5iGLBKTdrSk7WyVbmkv9beHaSXBuYjNA/0=";
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
