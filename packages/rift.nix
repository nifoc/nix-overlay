{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.3.9-unstable-2026-02-01";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "b3be792e4c8e48ab279b4c95d4064048cd4adcb2";
    hash = "sha256-i3P0geT52Dj0VJSIvkUEwb5exZ2nIfT7VCxjEtW4ckI=";
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
