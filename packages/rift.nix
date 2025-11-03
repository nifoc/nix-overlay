{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.1.0-unstable-2025-11-02";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "ab9971e1fedb6fd3a86021aad58cdc9ea11ffe5e";
    hash = "sha256-fq6nKRDJ7VFIJ7MkJKg9Tnmee/HiRDWDpdUYZ1LIv/s=";
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
