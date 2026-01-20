{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.3.6-unstable-2026-01-19";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "32e08d265a50da2de3b9f931603322347ae3eb90";
    hash = "sha256-FMqI/AY4L8Yj90FSnqRbq9Wzcy+2MfKVPSXKPUaXNDE=";
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
