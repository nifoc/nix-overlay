{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.10.1-unstable-2025-10-30";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "85fac5687f79c6f847ef858f728d454fbf3074df";
    hash = "sha256-ams+n9zV9pqGByb5OpLgZAc9bvjXwQ+B4ASIFWbJDMQ=";
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
