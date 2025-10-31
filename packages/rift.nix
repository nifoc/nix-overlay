{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.1.0-unstable-2025-10-30";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "f7486d7aa8087bac87d581256ead569f61e22ab9";
    hash = "sha256-brCz15UdheVf1+vU7OQw7EnElIKq8xsbV8jJ5b1HjEM=";
  };

  cargoHash = "sha256-EJPUC7xI0KKuXpua9O3bUvBbEnscRvms8gwdGkEk/Os=";

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
