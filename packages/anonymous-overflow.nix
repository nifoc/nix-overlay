{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "anonymous-overflow";
  version = "1.9.0";

  src = pkgs.fetchFromGitHub {
    owner = "httpjamesm";
    repo = "AnonymousOverflow";
    rev = "v${version}";
    sha256 = "sha256-7em/F2+VSM4kE7Hd2Aw0ka2+gWSxG3VMBs5iQnYwEqw=";
  };

  vendorSha256 = "sha256-dIzK8r3pPmV8B2xhpSK7Vg82RnsZ2kptEYOkYPZrPik=";

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
