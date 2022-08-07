{ system, lib, pkgs }:

pkgs.buildGoModule rec {
  pname = "q";
  version = "0.8.2";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Esg2i8UNT+SuW9+jsnVEOt1ot822CamZ3JoR8ReY0+4=";
  };

  vendorSha256 = "sha256-oarXbxROTd7knHr9GKlrPnnS6ehkps2ZYYsUS9cn6ek=";

  ldflags = "-s -w -X main.version=release";
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
