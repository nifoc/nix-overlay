{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = "redlib";
  version = "0.31.2";

  src = pkgs.fetchFromGitHub {
    owner = "redlib-org";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-h/UoMlCno9ua2H3dhOfN7S+3MEh8AbpcJ9+0IWootDM=";
  };

  cargoSha256 = "sha256-5ax7Y2HRSwRor9QR9ykF8gq6jqq+V3PglRxspHSF5ws=";

  buildInputs = lib.optionals isDarwin (with pkgs.darwin.apple_sdk.frameworks; [
    Security
  ]);

  doCheck = false;

  meta = with lib; {
    description = "Private front-end for Reddit";
    homepage = "https://github.com/redlib-org/redlib";
    license = [ licenses.agpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
