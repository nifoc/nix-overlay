{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.1-unstable-2026-06-04";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "db08871a2a4f8c341203d6dda591de784f826dd7";
    hash = "sha256-ke3kYHq+Bq8HbL8Ho2BTH4Cn92w0GfNNgD2Ef/DD7jI=";
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
