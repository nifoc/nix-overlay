{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "controld";
  version = "1.3.9";

  src = pkgs.fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    rev = "v${version}";
    hash = "sha256-fiFzqFo4StBHHbV3Y9SQ4zxYwNB/jiyNxf4e1NegWeY=";
  };

  vendorHash = "sha256-e/lIi7TRhwTjdcmT3bsCbg/mC/xPFR7kN0rnyQHJ81o=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A highly configurable, multi-protocol DNS forwarding proxy";
    homepage = "https://github.com/Control-D-Inc/ctrld";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
