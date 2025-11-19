{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.4-unstable-2025-11-18";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "5f8ab35331d948a0d608815c2283a2a16da9e45c";
    hash = "sha256-Zrw+tjKLoXBsnt/wEG16YC0LgIbVlXjsPfDfGNbIxbQ=";
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
