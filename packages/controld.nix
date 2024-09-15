{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "controld";
  version = "1.3.8";

  src = pkgs.fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    rev = "v${version}";
    hash = "sha256-jOYuvinNZkFHpxw2kUs0gX9Y6Jbl6nUWG/IMvQxtFeg=";
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
