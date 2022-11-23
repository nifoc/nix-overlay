{ system, lib, pkgs }:

pkgs.buildGoModule rec {
  pname = "q";
  version = "0.8.4";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-M2TgDha+F4hY7f9sabzZEdsxdp8rdXDZB4ktmpDF5D8=";
  };

  vendorSha256 = "sha256-216NwRlU7mmr+ebiBwq9DVtFb2SpPgkGUrVZMUAY9rI=";

  ldflags = "-s -w -X main.version=release";
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
