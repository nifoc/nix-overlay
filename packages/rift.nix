{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.8-unstable-2026-01-11";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "a173caf507f79879377378fdf1fbbdacc2e09029";
    hash = "sha256-DDIPUX5rB4cpMo2xUq7JwOZLNvLHzWZ7+2aKN2gDa3c=";
  };

  cargoHash = "sha256-A0huWauj3Ltnw39jFft6pyYUVcNK+lu89ZlVQl/aRZg=";

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
