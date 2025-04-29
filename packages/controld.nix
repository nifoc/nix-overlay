{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "controld";
  version = "1.4.3";

  src = pkgs.fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    rev = "v${version}";
    hash = "sha256-ivG5NHinsTi/AZYwyhUFj1ZZMfKMi64Cvzru2FDzeRw=";
  };

  vendorHash = "sha256-grqnroxGmbsgjJbFo3PUxCFsHS37LK9LygQCX1srcE0=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A highly configurable, multi-protocol DNS forwarding proxy";
    homepage = "https://github.com/Control-D-Inc/ctrld";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
