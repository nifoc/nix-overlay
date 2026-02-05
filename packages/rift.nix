{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.3.9-unstable-2026-02-04";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "de466fc210e5705aabea3fca8e32bb1451f1e7ed";
    hash = "sha256-XNMjQOcXWRb0pXFGZbp9mkVCQl4o9pk6K6CgAM7fVuQ=";
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
