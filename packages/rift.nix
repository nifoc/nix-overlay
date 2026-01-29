{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.3.8-unstable-2026-01-28";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "c0f63ec59e259861d19e72d8caf5ad7e6d602c12";
    hash = "sha256-aGRwN+Ivy3toWFkez8HivbkNadXUNNxxxjygeI9CSKA=";
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
