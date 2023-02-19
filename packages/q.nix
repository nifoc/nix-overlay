{ system, lib, pkgs }:

pkgs.buildGoModule rec {
  pname = "q";
  version = "0.9.0";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-WPVHMAau3+0jcIrRhRL5dy6h+J13LKj5GwQMJi7hGvo=";
  };

  vendorSha256 = "sha256-0Yd8y1SkxmfIFZuSheMGQnurlFv3sxkSDgGrQJLR3iU=";

  ldflags = "-s -w -X main.version=release";
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
