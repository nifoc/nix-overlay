{
  lib,
  rustPlatform,
  fetchFromGitHub,
  cmake,
  git,
}:
rustPlatform.buildRustPackage rec {
  pname = "cfsolve";
  version = "0-unstable-2026-11-07";

  src = fetchFromGitHub {
    owner = "chris124567";
    repo = pname;
    rev = "685b04919a94eb4a83c0a528d59213924c4b2ae2";
    hash = "sha256-+NvnqW/6bBVmthG1dpN8oqI+8H2X0s2lwfsYELJisZg=";
  };

  cargoHash = "sha256-r8Q5sXjxw/EqxW0PLTrLgVNeEm2gx4mUcRs5fZw4GQU=";

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
