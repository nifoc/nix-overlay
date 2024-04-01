{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin;
in
pkgs.rustPlatform.buildRustPackage {
  pname = "rexit";
  version = "1.3.0-unstable";

  src = pkgs.fetchFromGitHub {
    owner = "nifoc";
    repo = "Rexit";
    rev = "8bc9c9f74cf08ee74b701f86f4bc46c04404dd25";
    hash = "sha256-Q8LsbwHeiBm9Gld6d1c58YM6k62FPSPOjNChVA3R1ns=";
  };

  cargoSha256 = "sha256-GivHp/+YNGnxo9Sz4XiHEm1F685Rq+9SRcxL0Gz5Qjo=";

  nativeBuildInputs = with pkgs; [ pkg-config ];

  buildInputs = with pkgs; [
    libiconv
    openssl
  ] ++ lib.optionals isDarwin (with pkgs.darwin.apple_sdk.frameworks; [
    CoreFoundation
    CoreServices
    Security
  ]);

  doCheck = false;

  meta = with lib; {
    description = "This tool will export your reddit chats into a plethora of formats";
    homepage = "https://github.com/MPult/Rexit/";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
