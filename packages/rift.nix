{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.8-unstable-2025-12-05";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "bbd6b1a129ed8c00d3cca5a4488871b04147dbbc";
    hash = "sha256-4gqtYxHPfJn05ElKD3zcozi4RcRpEOw0aGVL1eyDAcY=";
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
