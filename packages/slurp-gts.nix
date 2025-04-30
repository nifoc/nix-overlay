{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "slurp";
  version = "0.1.0-unstable-2025-04-29";

  src = pkgs.fetchFromGitHub {
    owner = "VyrCossont";
    repo = pname;
    rev = "b620b465dcad179ae1a03f0d50da1d2fa1f8a518";
    hash = "sha256-6tCpceXK/FIl6xOTPgLCzCyhrM6Kt+JAuBJDcZC2si4=";
  };

  vendorHash = "sha256-e8uEC6aRFdhhBTpUyOpv6ZWfQl9FE8EVEdEyBJFcYp4=";

  doCheck = false;

  meta = with lib; {
    description = "tool for exporting data from and importing data to Fediverse instances";
    homepage = "https://github.com/VyrCossont/slurp";
    license = [ licenses.agpl3Only ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
