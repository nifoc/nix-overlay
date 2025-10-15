{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.1.1-unstable-2025-10-15";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "228d1b7b1f65909ac562aeb43e99166988e13154";
    hash = "sha256-ZS9uSrppqZ0ko3TSCHwddKEn1IlGl964rnWJheyR/+Y=";
  };

  cargoHash = "sha256-KUj9a9fUZBpIyMtW8oG797xVApDb8W+vUVuRQyjmlvg=";

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
