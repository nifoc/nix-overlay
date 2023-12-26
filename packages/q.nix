{ pkgs, lib }:

pkgs.buildGo121Module rec {
  pname = "q";
  version = "0.19.1";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-PNCpETT39z2As05XVUrCBlIzTi/ml/1AwmYVFGDJvGA=";
  };

  vendorHash = "sha256-ma7x0sm27eT5Ph57B/wsmCxU2nmA4G4h1iOKjXC2EYY=";

  ldflags = "-s -w -X main.version=release";
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
