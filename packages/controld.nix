{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "controld";
  version = "1.3.11";

  src = pkgs.fetchFromGitHub {
    owner = "Control-D-Inc";
    repo = "ctrld";
    rev = "v${version}";
    hash = "sha256-McUQghJc8ecS3Le7CGkUCkhkcIO9+h9IJicrBMW2yJk=";
  };

  vendorHash = "sha256-QPq75h8NaG8Aoxf7fuNkqRSZRK4DQsP41aPhD9nZ7ks=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A highly configurable, multi-protocol DNS forwarding proxy";
    homepage = "https://github.com/Control-D-Inc/ctrld";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
