{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.5-unstable-2025-11-24";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "eef98dde79ce2e66f01a4787a19038afa7df91d3";
    hash = "sha256-jkrmJyNXrxmKU0LE8k5/f7HZ55j9O9WxxJwivWzgMuU=";
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
