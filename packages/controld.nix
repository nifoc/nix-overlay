{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "controld";
  version = "1.5.0";

  src = pkgs.fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    rev = "v${version}";
    hash = "sha256-KrkEI07wfddDGmor2VT3I5gGmeZX75UGLZl++a6sE+c=";
  };

  vendorHash = "sha256-rsRlInNk6/C9DzJLbCoQSbV1exGfstbTxE8qitKmZ0c=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A highly configurable, multi-protocol DNS forwarding proxy";
    homepage = "https://github.com/Control-D-Inc/ctrld";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
