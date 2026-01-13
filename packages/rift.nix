{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.8-unstable-2026-01-12";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "c6283c2cf42d77b9d5b0472c215120917b3fde31";
    hash = "sha256-43DpPjI/nOxpQI583L+WnBhdg0hCZdOT1VtYVqxYC/Y=";
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
