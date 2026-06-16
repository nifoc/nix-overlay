{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.3-unstable-2026-06-15";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "b39de0d995207cea862c64e3caf6eed2143ce09e";
    hash = "sha256-oOVNq4/hdiRcCbc9kaMxynnq2gXVezviQRTvjrdkfPs=";
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
