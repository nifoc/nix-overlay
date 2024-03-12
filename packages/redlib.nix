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

  cargoPatches = [
    ../patches/redlib_cargo-lock.patch
  ];

  cargoSha256 = "sha256-0ExHV7m9j4HFDpZqp32XYXmwHhyRobS1CUymRB0lt4Y=";

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
