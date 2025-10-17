{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.3-unstable-2025-10-16";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "ad6b6c4596ecc2ecb6d53b79c5964a8430b8a79c";
    hash = "sha256-C63D/K8mDYe3kyAQBcZH6DV6wpGbchg4Zzb7McJ1Yhs=";
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
