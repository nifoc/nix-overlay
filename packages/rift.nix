{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.3.8-unstable-2026-01-23";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "1c8882b8e94db71cb3e33e7632209d85f5f5c43a";
    hash = "sha256-4CExoT2fxx1YlZRxorpQIyvckaZvR8Y/wA0Fc5/bW8Y=";
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
