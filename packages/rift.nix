{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.4-unstable-2025-11-13";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "93e35fe8b36adc316756882b844c0130f1f8db5a";
    hash = "sha256-Xot9yE0z/X2wcTtF+HkDnCUCbpkj8TT+sAVErKY2UAg=";
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
