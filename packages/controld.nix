{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "controld";
  version = "1.3.7";

  src = pkgs.fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    rev = "v${version}";
    hash = "sha256-3rAGH3GfCQR+Ii5KazsgQzydeWlPeHpiEvHNHQXjNVQ=";
  };

  vendorHash = "sha256-UN0gOFxMS0iWvg6Iv+aeYoduffJ9Zanz1htRh3ANjkY=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A highly configurable, multi-protocol DNS forwarding proxy";
    homepage = "https://github.com/Control-D-Inc/ctrld";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
