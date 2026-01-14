{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "controld";
  version = "1.4.9";

  src = pkgs.fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    rev = "v${version}";
    hash = "sha256-DKnQ4xtn1XHeu+1fm6g/qRyS6twbChEsw17gz8mv1xU=";
  };

  vendorHash = "sha256-Wydxn7tRFU3SXdY3NIlI+Welwxs1UcNHzYz5AwDI/L8=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A highly configurable, multi-protocol DNS forwarding proxy";
    homepage = "https://github.com/Control-D-Inc/ctrld";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
