{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.3.7-unstable-2026-01-20";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "f6bef77e997fdc7887cdc80fd1655aaa1623e4a3";
    hash = "sha256-xxSMg2g0hEBMP5o2GchTS7CmLSfnzO7PFntog8tO6x8=";
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
