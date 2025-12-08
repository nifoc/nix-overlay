{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.8-unstable-2025-12-07";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "7e22faca5c5c45b13f8de8edc0029cd2dfd54e1a";
    hash = "sha256-oI4gcQwvmFjtjydfKcyb4cNJ/RcDDsZroM8sY5+n+Rk=";
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
