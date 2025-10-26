{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.9-unstable-2025-10-25";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "ccc8fd9fc259d1e2faf3821417a628a388cd1724";
    hash = "sha256-Dd8eBeH8lH88CMmIXrTYE4UlgdNNn6W3j2PhgbUUhBE=";
  };

  cargoHash = "sha256-+DWieSNh7B2EW9AvAT97Q6wSE+T4h5McVW6X6lqDA6Y=";

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
