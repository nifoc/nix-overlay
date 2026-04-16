{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.4.0-unstable-2026-04-15";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "27f5f00e7f40e7ba1b01cd25721b2545f255d42f";
    hash = "sha256-JH6G5PWaR8Kw/hE4Rb6RvrkvBX6Hn4u1g+OFXE2Mmkc=";
  };

  cargoHash = "sha256-2KMEjAGWxMzcY9yE5v9SmAspA4tDJtNwS0GlEm4opKc=";

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
