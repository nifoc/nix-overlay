{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage rec {
  pname = "rift";
  version = "0.5.9";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-tc0qf1xa9mK122DzC0amJuqL4TlB2YV1L5OyHz9tXzw=";
  };

  cargoHash = "sha256-GQCMxB1f2hMaHVeIdspqi8MiNOBrCwnB147zvvYREJE=";

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
