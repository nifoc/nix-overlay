{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = "redlib";
  version = "0.31.0";

  src = pkgs.fetchFromGitHub {
    owner = "redlib-org";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-d3Jjs/a2EgdqRBTjXKwDDRnU6orb7RQGl1CVz9b9SdI=";
  };

  cargoSha256 = "sha256-2MugS0/MO85lQvDbiFwnsX4LYdk7TACDFR8OOLEFGUQ=";

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
