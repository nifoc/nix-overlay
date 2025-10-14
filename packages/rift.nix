{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0-unstable-2025-10-14";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "3a786e3a69c7588f3539acb10a8e5ad7b139588e";
    hash = "sha256-vSvNj7NFns5aRdDylDcI5/E8wGcS1mYEAyM5F3A5uLI=";
  };

  cargoHash = "sha256-KsbbeuVEkvZgRLbP9ZMBYnRVNMOuxtJpXb3Us9ewiGY=";

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
