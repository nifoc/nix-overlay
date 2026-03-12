{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.0-unstable-2026-03-11";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "58f90f0f81c048b15ac1f25f692601082afe2bbc";
    hash = "sha256-3X5uDlZi2jI/JWmauAEOr3pH42Qcp2yYBRoYHZCSpIk=";
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
