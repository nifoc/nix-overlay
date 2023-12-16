{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin;
in
pkgs.rustPlatform.buildRustPackage {
  pname = "rexit";
  version = "1.3.0-unstable";

  src = pkgs.fetchFromGitHub {
    owner = "MPult";
    repo = "Rexit";
    rev = "4d0bbc84f21113d0741d8bee813e4437aded44ca";
    sha256 = "sha256-isPrJ0BizVA03E57iJzlWiJhHNRfyaYkw4BupDtpvao="; 
  };

  cargoSha256 = "sha256-5NYzCYm8Aq7/aP1oEdE0dWssaxFPb6IOBQMol1F3heg=";

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
