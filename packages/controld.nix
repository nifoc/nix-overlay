{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "controld";
  version = "1.4.7";

  src = pkgs.fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    rev = "v${version}";
    hash = "sha256-FgFbnUITR1InaK38ngq6scKv7PQWEKjz6dLLsnCoq5U=";
  };

  vendorHash = "sha256-OX+1lZaAjN8evsWBnwwwFH4hHucp3w1NxXJruIWTXYU=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A highly configurable, multi-protocol DNS forwarding proxy";
    homepage = "https://github.com/Control-D-Inc/ctrld";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
