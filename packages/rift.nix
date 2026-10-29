{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage rec {
  pname = "rift";
  version = "0.7.2";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-LXht4AfIBiSeS5jRZiadNBFBtpvZkB9bPRF/svXLqbc=";
  };

  cargoHash = "sha256-ZyRcaoNOkUKMqS77tz5ijmJR8lyAujPSpkVNbQ+6/Jo=";

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
