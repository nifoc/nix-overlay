{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = "redlib";
  version = "0.34.0";

  src = pkgs.fetchFromGitHub {
    owner = "redlib-org";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-JpuCX2ae9me+zHxQj5jqQlgDci2NV+TEVUAqnuTn3cA=";
  };

  # cargoPatches = [
  #   ../patches/redlib_cargo-lock.patch
  # ];

  cargoSha256 = "sha256-gkRblCHUFiprZeYtu43GIGBZqCq5l/HEGaQN91XbfSs=";

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
