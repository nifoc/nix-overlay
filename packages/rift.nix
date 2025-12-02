{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage {
  pname = "rift";
  version = "0.2.6-unstable-2025-12-01";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = "rift";
    rev = "ee4afc9396416cfa83ba92934cafcb8221b04a5e";
    hash = "sha256-XSE4UR2TPlN+gAdPO3Xa5jlfBMF7Exga15IruJ9+rt0=";
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
