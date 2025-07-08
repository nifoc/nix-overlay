{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "q";
  version = "0.19.5";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Chvh+L1RV/T/blFjGS2wiJynXxbWE6eKbu4TRTFTb3o=";
  };

  vendorHash = "sha256-7OknLdkJB3ujX/DL+DVdWFK5RcoEw5R9h/KY4OfKeCw=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
