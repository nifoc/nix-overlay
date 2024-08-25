{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "anonymous-overflow";
  version = "1.13.0";

  src = pkgs.fetchFromGitHub {
    owner = "httpjamesm";
    repo = "AnonymousOverflow";
    rev = "v${version}";
    hash = "sha256-hvcOJctvNswEws+cCoeGQSvFzZvnThhKk3fJ7TnNulY=";
  };

  vendorHash = "sha256-P3kUGFJhj/pTNeVTwtg4IqhoHBH9rROfkr+ZsrUtmdo=";

  postInstall = ''
    mkdir -p $out/share/anonymous-overflow
    cp -r public $out/share/anonymous-overflow/public
    cp -r templates $out/share/anonymous-overflow/templates
  '';

  meta = with lib; {
    description = "View StackOverflow in privacy and without the clutter.";
    homepage = "https://github.com/httpjamesm/AnonymousOverflow";
    license = [ licenses.mpl20 ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
