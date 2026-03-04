{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "q";
  version = "0.19.12";

  src = pkgs.fetchFromGitHub {
    owner = "natesales";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-0m6xcmnHh6qn2spcJxlcjdO4Fd2U0UZE/ZHMq6HXW3M=";
  };

  vendorHash = "sha256-gY3o5rkHLptrq7IEJ3AVhKY+PONJw6WC1yM3fu2ZB38=";

  ldflags = [ "-s" "-w" "-X main.version=${version}" ];
  doCheck = false;

  meta = with lib; {
    description = "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.";
    homepage = "https://github.com/natesales/q";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
