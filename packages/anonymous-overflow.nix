{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "anonymous-overflow";
  version = "1.8.3";

  src = pkgs.fetchFromGitHub {
    owner = "httpjamesm";
    repo = "AnonymousOverflow";
    rev = "v${version}";
    sha256 = "sha256-qPwKkxWvavCtYrALr9ZWk0MUo1GDlCR9vg0Lh/BLoAk=";
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
