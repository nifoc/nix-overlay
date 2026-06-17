{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.3-unstable-2026-06-16";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "23a4c9d7a3acc5a0477dc5259715c80af7236bde";
    hash = "sha256-IxMA4E8+vY1ZgQPBV59wYWmuAiTv3LLpTomjPZDlKJI=";
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
