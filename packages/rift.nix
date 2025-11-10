{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.0-unstable-2025-11-09";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "1f067dd84cc40c6e939dfa3572d9a9131a1c09f1";
    hash = "sha256-WNPTFF8cupVDXjDG5ZL4fJeWDYAISLGOsFSVTFUVkKo=";
  };

  cargoHash = "sha256-RoT0rwek5MIPBUvaZ3WJsSxO/meCKXW+fyDZUBa92Bs=";

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
