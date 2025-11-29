{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.5-unstable-2025-11-28";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "0ff6212d6f73edb8db073c710412afde2c8219b6";
    hash = "sha256-0bVEAcxvF/JWJ5/3hFTpC6q9lQ9iLFpcBlautdVAIrs=";
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
