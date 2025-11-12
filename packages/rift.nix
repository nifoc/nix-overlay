{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.1-unstable-2025-11-11";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "3de151b27fb856f8c261fab6dcbac9129e2bda23";
    hash = "sha256-udCjYEOKJtjSD8vGB1F+9+12t4uT0Mto/hBke84RiaU=";
  };

  cargoHash = "sha256-5jz8HXPl+E+2cOlOGoug/2AY1Kk9Z+TFhX97J11aEcc=";

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
