{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.9-unstable-2025-10-27";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "bdecc66d3f648dd18645a04ea824ea34a31ebb01";
    hash = "sha256-mHoaYBMG6RXKyymlVxrG/IwwBN19oObmnpTw9a1MxOM=";
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
