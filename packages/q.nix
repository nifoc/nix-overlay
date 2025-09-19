{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "q";
  version = "0.19.9";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-QYSy2RaEWNkitehsmcfGYTCvpHtu1aVRuwBVNMjOHZ0=";
  };

  vendorHash = "sha256-g5ZrzkPqkvoz0Q0ERXYlNk7lDf+6V27yKa+5NLVZHCI=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
