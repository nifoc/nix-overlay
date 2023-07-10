{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "q";
  version = "0.11.3";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-lhExnXxM28aIiFsYy46sOfWSsLD/+lnQnZY2ZY0D90o=";
  };

  vendorSha256 = "sha256-cZRaf5Ks6Y4PzeVN0Lf1TxXzrifb7uQzsMbZf6JbLK4=";

  ldflags = "-s -w -X main.version=release";
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
