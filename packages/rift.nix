{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.0-unstable-2026-03-03";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "78c67e58543abd2f5546c9b3f1122550623aabbf";
    hash = "sha256-3TKhoLJE+GtTfcnskH7yUBamCV+G5xXzy1n15mNWDzk=";
  };

  cargoHash = "sha256-2KMEjAGWxMzcY9yE5v9SmAspA4tDJtNwS0GlEm4opKc=";

  buildInputs = lib.optionals stdenv.isDarwin [
    apple-sdk_15
  ];

  RUSTC_BOOTSTRAP = 1;

  doCheck = false;

  meta = {
    description = "Tiling window manager for macOS";
    homepage = "https://github.com/acsandmann/rift";
    license = lib.licenses.mit;
    platforms = lib.platforms.darwin;
    mainProgram = "rift";
  };
}
