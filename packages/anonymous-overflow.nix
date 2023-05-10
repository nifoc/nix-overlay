{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "anonymous-overflow";
  version = "1.8.2";

  src = pkgs.fetchFromGitHub {
    owner = "httpjamesm";
    repo = "AnonymousOverflow";
    rev = "v${version}";
    sha256 = "sha256-5FL3Latgd8LsfdA5ddwk8BbTRd00+y1D2I0wxTYu7v4=";
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
