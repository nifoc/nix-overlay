{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.3-unstable-2025-10-17";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "683fca0e97f499cc5533f359a89409be9b9f55ec";
    hash = "sha256-oJ9OazbPD3r4uWllko+pXH98O/1lxBtuidtyl9d/ZF0=";
  };

  cargoHash = "sha256-Lb10n55uJbbcglN9KXI2oszZnOEQhoZqyDCBqiR3mvE=";

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
