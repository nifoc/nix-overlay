{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.1.1-unstable-2025-11-08";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "cdb1f356aed59e6f05b47863159c55aa7934a911";
    hash = "sha256-m0u7B5S1Cay3ML2QrazIuXheuGJdca3aDYAT+MoaT+s=";
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
