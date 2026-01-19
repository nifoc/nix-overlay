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
    rev = "816f93a3d83c14f751c71d9eff136517d6ee53fc";
    hash = "sha256-UZOlV0evc2o5SSKgxDnkhdbxFOc2NRvp25Jj2Ejc/zE=";
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
