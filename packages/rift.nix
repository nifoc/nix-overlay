{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.1-unstable-2026-05-15";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "955ac8ab78b654ce4b9ea497a959aeb6dea61fe7";
    hash = "sha256-0yiZ7f+NnXpz4rwJvFagwPZ6WVHaCfQfG35Eqw7ha9k=";
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
