{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  apple-sdk_15,
}:
rustPlatform.buildRustPackage rec {
  pname = "rift";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "acsandmann";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-aC6Drc45/WXlHxJLACVtlsvdnFp3BTRXpPP62vu/7YQ=";
  };

  cargoHash = "sha256-qN34EIfS6etz4E5PO17QoUp9YrfiqVcYgz+cs+B1c9w=";

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
