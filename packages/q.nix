{ pkgs, lib }:

pkgs.buildGo121Module rec {
  pname = "q";
  version = "0.19.2";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-kfuf0iwRYNxd9TfIIHvAqLxXjesQh7jC0evT9DQrrzQ=";
  };

  vendorHash = "sha256-6kdf+LwMrIjwC3uZHlMdpEHvonxKfr86PQaMOgzgYOc=";

  ldflags = [ "-s" "-w" "-X main.version=release" ];
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
