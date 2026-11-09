{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage rec {
  pname = "rift";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-iGz3QRU3t0nNEvtZ/i/9LmUncCEyKWy14MkkuZVb4hQ=";
  };

  cargoHash = "sha256-lhOc53eMJIpdO8iPylcN6I9N5WwMTT6XhaZwh4jD6So=";

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
