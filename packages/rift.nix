{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.3.5-unstable-2026-01-18";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "fd9b5798f3b609a37bcd45f53b9999090f381cca";
    hash = "sha256-UbFTO8pKbo+dlAQSP/e4Lm663IsV0sIHU0csJk5DYwA=";
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
