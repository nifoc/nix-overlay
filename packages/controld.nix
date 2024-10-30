{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "controld";
  version = "1.3.10";

  src = pkgs.fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    rev = "v${version}";
    hash = "sha256-gUGN6kW1kVnCqzjZpA6s6y7H/fTc63UUbR5bfdr2ues=";
  };

  vendorHash = "sha256-I7LaF38vyK8riqfUWyZCAdtbK7KdU7g4PhS/Pac5T00=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A highly configurable, multi-protocol DNS forwarding proxy";
    homepage = "https://github.com/Control-D-Inc/ctrld";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
