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
    rev = "c5f9ebcb8051ddc3a4203290a451cddfb47ebd50";
    hash = "sha256-4ITK2vG6LG3M0hbpDKj7NT9a6ah95GdGag0pI9x3OBQ=";
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
