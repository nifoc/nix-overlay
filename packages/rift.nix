{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.1.1-unstable-2025-11-07";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "907d2d4823d08a8d5a8dbe7adee9615b15d32d49";
    hash = "sha256-+heeRH7HyEtJAIGX2iRM9BoeU05QIDadtaFhTrlwBjM=";
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
