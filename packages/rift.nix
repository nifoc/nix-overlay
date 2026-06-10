{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.1-unstable-2026-06-10";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "c0b27557887fff23265c3c2fa16a55be6388c8e0";
    hash = "sha256-1AWzrx0EdfpDKUyf2tdzl3PTRmRUaINSyIJKNd1+aNY=";
  };

  cargoHash = "sha256-eb3Z5NIUusJApQWa6sDMRP//Y0BOToQsEIhQqqR728o=";

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
