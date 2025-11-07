{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.1.1-unstable-2025-11-06";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "b10ba249947dc65f00fa4d16c614440da31f0299";
    hash = "sha256-zlNEdzX0DnnanMHX3mO4SkgIy7evFenB9AKoh8sTWDY=";
  };

  cargoHash = "sha256-EJPUC7xI0KKuXpua9O3bUvBbEnscRvms8gwdGkEk/Os=";

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
