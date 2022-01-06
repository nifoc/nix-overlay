{ system, lib, pkgs }:

pkgs.rustPlatform.buildRustPackage rec {
  pname = "proximity-sort";
  version = "1.0.7";

  src = pkgs.fetchFromGitHub {
    owner = "jonhoo";
    repo = pname;
    rev = "v${version}";
    sha256 = "ZDG45GETZfkCo6OO5DaN10EviaOf18k71Kw6Ni8ygDQ=";
  };

  cargoSha256 = "sha256-/FF5CtUdf5uSu9AR9OPRXisYs6PRTwKwGWssxzVpb4g=";

  meta = with lib; {
    description = "Simple command-line utility for sorting inputs by proximity to a path argument";
    homepage = "https://github.com/jonhoo/proximity-sort";
    license = [ licenses.asl20 licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" ];
  };
}
