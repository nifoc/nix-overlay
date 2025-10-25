{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.8-unstable-2025-10-24";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "e81fde300846295dd9fe78d9a3369a805e0d027d";
    hash = "sha256-Aj7qbeMml3Rd7GSk0guSLo1bjWUEcAnDAeCqL1SWlKg=";
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
