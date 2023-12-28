{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = "redlib";
  version = "main";

  src = pkgs.fetchFromGitHub {
    owner = "redlib-org";
    repo = pname;
    rev = "7d952f7f18733d23a296afa226be216cbd1f3aea";
    sha256 = "sha256-2AcJoXQOhmIKIkDZzgA8btRwTvgWjlPWc67cRIzRg/4=";
  };

  cargoSha256 = "sha256-MZ3T8fvYYCYn7Pt5YiViabfh/YzKQbOb0CwhY3iP/eg=";

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
