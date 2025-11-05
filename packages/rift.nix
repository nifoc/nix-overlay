{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.1.0-unstable-2025-11-04";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "834439480032f5d37be2d4875f02fba3a4602532";
    hash = "sha256-uVR2GY8dnCWqEYUCUDZU7xrowzbim/AxF99PrTxthMk=";
  };

  cargoHash = "sha256-YPVjwuyBI8GU9rw/ECqPJKqiDZ8kOWyogl8OUZdmfxA=";

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
