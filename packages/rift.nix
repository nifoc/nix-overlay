{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.3.4-unstable-2026-01-16";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "4b04099ba5cf84d08da09625aec5d7fa16989d32";
    hash = "sha256-4iaAmhCwdKnOudN/ML/sSbC7W0l3/D13QzH0sPfk/N0=";
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
