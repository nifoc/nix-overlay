{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.4.1-unstable-2025-10-20";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "46d8524a32db4f56c7f554dd1f8f17767c34d098";
    hash = "sha256-ja/w8xVJHnMWUAJYYDdcLaS3Mq0UOhL0YxZjlu8huAQ=";
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
