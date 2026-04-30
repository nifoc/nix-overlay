{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.0-unstable-2026-04-29";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "6a2aa3223b0e5d8667a86b0abd50ed1de49d0b46";
    hash = "sha256-pHlZ2ZXrRlZwRH1pQDLcLP438Dyx4iSTwsXVLrwfjMw=";
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
