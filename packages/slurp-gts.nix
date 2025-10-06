{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "slurp";
  version = "0.1.0-unstable-2025-10-05";

  src = pkgs.fetchFromGitHub {
    owner = "VyrCossont";
    repo = pname;
    rev = "09cda949528ec0b0bbe026de4eae631207c6bad1";
    hash = "sha256-EK9viZthZAI6Me2qa1QICqa8FBUX6yt/uX8Wxo2dVyI=";
  };

  vendorHash = "sha256-E8X6cG9ydGY/KLDzoQYfF3ZVnSF8vwnwYxaTdVGwHEU=";

  doCheck = false;

  meta = with lib; {
    description = "tool for exporting data from and importing data to Fediverse instances";
    homepage = "https://github.com/VyrCossont/slurp";
    license = [ licenses.agpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
