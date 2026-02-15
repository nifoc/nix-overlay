{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.3.9-unstable-2026-02-14";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "6bc2ee6086a16e29981e3e53eeace89f6b749b6a";
    hash = "sha256-JZWUdiRM3Ey4GzUjt9Irb3RYRxJPTQkvfh7xFxWso8E=";
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
