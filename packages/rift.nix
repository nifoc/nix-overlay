{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage rec {
  pname = "rift";
  version = "0.5.7";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-c4WZ4Q862UyKpvGqd+4vXFssaeFEaAaDtszEi7PrstA=";
  };

  cargoHash = "sha256-wxymypJjczFqI9oivnVX/TOnR1KuupsaryQIQQVN7Gs=";

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
