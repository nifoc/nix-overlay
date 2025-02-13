{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "controld";
  version = "1.4.0";

  src = pkgs.fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    rev = "v${version}";
    hash = "sha256-0l6wHACMRzuHtcfQWrtSUjy2PWcwhZeoF3mGpT0jAyA=";
  };

  vendorHash = "sha256-FqrEMXByP/gny4HVVS/D4YDFIWrYS+ioyTOgvjAwyqU=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A highly configurable, multi-protocol DNS forwarding proxy";
    homepage = "https://github.com/Control-D-Inc/ctrld";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
