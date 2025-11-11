{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.1-unstable-2025-11-10";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "6f2fb8040f8bc5ea0a590104e05541c14a8db8bb";
    hash = "sha256-TCgyqb23kmD3yJ3IiWTBXnWXDA4QJpXxSEbiC+H8IH8=";
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
