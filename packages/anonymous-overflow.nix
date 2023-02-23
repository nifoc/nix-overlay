{ system, lib, pkgs }:

pkgs.buildGoModule rec {
  pname = "anonymous-overflow";
  version = "1.8";

  src = pkgs.fetchFromGitHub {
    owner = "httpjamesm";
    repo = "AnonymousOverflow";
    rev = "v${version}";
    sha256 = "sha256-SO1Oa4v6Xw7InepTQTOTrQoTYIcYxnVOwi77Qbw/9N4=";
  };

  vendorSha256 = "sha256-CAEGKBNqVnNJn8vP8yR93WKFNu/WLn9+kYinQQtiAYE=";

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
