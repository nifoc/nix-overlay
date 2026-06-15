{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.2-unstable-2026-06-14";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "05ea842d2d58fe9df1d86f699591a5ab8edde36c";
    hash = "sha256-C4iI63mDD8NC2YkgeBACJchcqQLKQ2dpYUmU08y7CSQ=";
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
