{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.3.7-unstable-2026-01-22";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "f8a3c378342467d84451d0f4ab227e1566d7d4dd";
    hash = "sha256-UiepdHI3qgWS20n8wCh4zEOMAPFDNgt3kPmaBQHaHvY=";
  };

  cargoHash = "sha256-A0huWauj3Ltnw39jFft6pyYUVcNK+lu89ZlVQl/aRZg=";

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
