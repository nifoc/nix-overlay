{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.6-unstable-2025-12-03";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "d1f5b0ac8c8faaaecc80890725397987d9e2d722";
    hash = "sha256-KeaYGtlGmKfHoCOZvIRS2Ld/sBaGXPXcaz09UQ3gIxw=";
  };

  cargoHash = "sha256-A0huWauj3Ltnw39jFft6pyYUVcNK+lu89ZlVQl/aRZg=";

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
