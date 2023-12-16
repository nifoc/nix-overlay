{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = "rexit";
  version = "1.2.1";

  src = pkgs.fetchFromGitHub {
    owner = "MPult";
    repo = "Rexit";
    rev = "v${version}";
    sha256 = "sha256-KnwyyMC/uUcOlrCMofMjN7F6FAkUGFQ9m7COUaGDGdE=";
  };

  cargoSha256 = "sha256-69vqfut2uRReZXT+ILFlaCZ3mTtr0yhKgFSv1wZgZVI=";

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
