{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.8-unstable-2025-12-08";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "f5d6589d56ee45ce99e17a2e427a3a9f3322642d";
    hash = "sha256-LEcHQ5MYEOabtjK4WBtCiXesnNxrL7GdpT6EaJqt3LE=";
  };

  cargoHash = "sha256-A0huWauj3Ltnw39jFft6pyYUVcNK+lu89ZlVQl/aRZg=";

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
