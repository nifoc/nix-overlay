{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.2-unstable-2025-10-15";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "38ef163aa88b910f1d77e3f94dc55b957f803301";
    hash = "sha256-9mTchsjvLZgE2bIqdcoE45yJJYXnI7BxRbJPztIEI6w=";
  };

  cargoHash = "sha256-Lb10n55uJbbcglN9KXI2oszZnOEQhoZqyDCBqiR3mvE=";

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
