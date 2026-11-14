{
  lib,
  rustPlatform,
  fetchFromGitHub,
  cmake,
  git,
}:
rustPlatform.buildRustPackage rec {
  pname = "cfsolve";
  version = "0-unstable-2026-11-13";

  src = fetchFromGitHub {
    owner = "chris124567";
    repo = pname;
    rev = "19efa31656328528457376ae0895a61164b22da0";
    hash = "sha256-vaXvhG/hqfs87CVZGUs8uMPtu+hLUM5/yZfgkpfvsAw=";
  };

  cargoHash = "sha256-TXZTAkiqxFMUX19C7R/rApPyaToHqIXrVTw15f7cK6w=";

  nativeBuildInputs = [
    cmake
    git
    rustPlatform.bindgenHook
  ];

  doCheck = false;

  postInstall = ''
    mkdir -p "$out/share"
    cp -r profiles "$out/share"
  '';

  meta = {
    description = "Cloudflare turnstile and challenge page solver in Rust";
    homepage = "https://github.com/chris124567/cfsolve";
    license = lib.licenses.mit;
    platforms = [
      "x86_64-darwin"
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];
    mainProgram = "challenge";
  };
}
