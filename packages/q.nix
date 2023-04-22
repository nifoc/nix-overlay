{ system, lib, pkgs }:

pkgs.buildGoModule rec {
  pname = "q";
  version = "0.11.1";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-dJ+0AvqtlzaKsHd1brmQZ71Oryf6TU1SwACwQyaQrrY=";
  };

  vendorSha256 = "sha256-jjhDD0qZh4QHjFO14+FsRFxEywByHB2gIxy/w3QOWBk=";

  ldflags = "-s -w -X main.version=release";
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
