{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "q";
  version = "0.19.10";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-bP4aFoGv7VlzCXkMYzDHp3VzgA3MpqugmNE3Vyta4iM=";
  };

  vendorHash = "sha256-4W0lS7qh3CCSbAtohc/1EbwdiO75tELTp1aBMyPeh/o=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
