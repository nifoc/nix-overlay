{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin;
  inherit (pkgs.stdenv) isLinux;
in
pkgs.rustPlatform.buildRustPackage {
  pname = "rexit";
  version = "1.2.0";

  src = pkgs.fetchFromGitHub {
    owner = "nifoc";
    repo = "Rexit";
    rev = "a2c8979a9755e609adb618c6a10d740e73adff74";
    sha256 = "sha256-6EiSwviHpmqBljTA3nqRIavpk7NbyMktUhxkpN7efq4="; 
  };

  cargoSha256 = "sha256-HZJZ15bPV/CW6w2T5ALVsp2ngLU/5B0Vjn5n/kSatp4=";

  buildInputs = with pkgs; [
    libiconv
  ] ++ lib.optionals isDarwin (with pkgs.darwin.apple_sdk.frameworks; [
    CoreFoundation
    CoreServices
    Security
  ]) ++ lib.optionals isLinux (with pkgs; [
    openssl
    pkg-config
  ]);

  doCheck = false;

  meta = with lib; {
    description = "This tool will export your reddit chats into a plethora of formats";
    homepage = "https://github.com/MPult/Rexit/";
    license = [ licenses.gpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
