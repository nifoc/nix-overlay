{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.0-unstable-2026-03-23";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "b92de99836aeb24b017b857c89d4f45e9a824f38";
    hash = "sha256-Pqy6yXsT7JGgkwspzYt8ZT5nN0d++563Y5x6P8zKEds=";
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
