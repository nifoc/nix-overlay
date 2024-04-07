{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "anonymous-overflow";
  version = "1.12.1";

  src = pkgs.fetchFromGitHub {
    owner = "httpjamesm";
    repo = "AnonymousOverflow";
    rev = "v${version}";
    hash = "sha256-VGtmqpTxJ4o0adpvh6EyVeo/4d1RFMXJb21enXn69Ig=";
  };

  vendorHash = "sha256-ycRTNCBN0jlkgqRNsSqh7DB1JGdmrGuRRgRr79Ugp3U=";

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
