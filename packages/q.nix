{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "q";
  version = "0.12.0";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Z62xxmbzouuP0ol0sJxlh3bQr/sysFSqo7Y5b26IJ1g=";
  };

  vendorSha256 = "sha256-uWPvUz8H9e/deZ3JmpRBNEG6UXAQa1068fZwQoeiKkc=";

  ldflags = "-s -w -X main.version=release";
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
