{ pkgs, lib }:

pkgs.buildGo121Module rec {
  pname = "q";
  version = "0.15.1";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-yItgytsPR/FkiERHhLTq1vNJbZ204DckEc3xK3PaPKM=";
  };

  vendorSha256 = "sha256-xLv2F/rOSjMTnTrLck/1E8Y0fTbpUutQIJGmqetqYjg=";

  ldflags = "-s -w -X main.version=release";
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
