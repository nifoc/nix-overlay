{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage rec {
  pname = "rift";
  version = "0.8.5";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-5DBFfe4WIbFRg1hCg61h33QMvORrLkA6iHBSmUA2LJo=";
  };

  cargoHash = "sha256-UbXSHPfv69Pq7X/JWAwK4mf2Kx9Reap35ubgUzKrnME=";

  buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [
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
