{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.10.1-unstable-2025-10-28";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "099ee1d4becb18f17a0abee7b314630271972fe6";
    hash = "sha256-BzWnUnEs8DCEwO+yfYsbSq832Ee1hNclLmtkz6etHLE=";
  };

  cargoHash = "sha256-9pKA9vKfW3zIYvbrIbld/X26blmupdZm+SmmQOGoeJI=";

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
