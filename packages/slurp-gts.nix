{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "slurp";
  version = "0.1.0-unstable-2025-03-07";

  src = pkgs.fetchFromGitHub {
    owner = "VyrCossont";
    repo = pname;
    rev = "8350b6e1b9d9d6f7ca47bfe6cdd436a7a8c69257";
    hash = "sha256-uKdbs7ta2O+ZtyFmJEVFFEwNR1DlqSSGRpkQaZEu1M4=";
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
