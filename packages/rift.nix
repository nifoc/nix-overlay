{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.0.5-unstable-2025-10-21";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "deb63056f65163b1361b759f68eb108e5199bd79";
    hash = "sha256-BipfGokkfEILiiUDEJmNJZMI6tXORkNgwll7PR2+n7w=";
  };

  cargoHash = "sha256-+DWieSNh7B2EW9AvAT97Q6wSE+T4h5McVW6X6lqDA6Y=";

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
