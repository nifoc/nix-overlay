{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.1-unstable-2026-06-13";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "2aaeeacce20d0069956846f55d3dbeecd1afd984";
    hash = "sha256-EW88n2ywmHTMuH86w4vV6P5R+oMfg+IvgfsswtEZvR0=";
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
