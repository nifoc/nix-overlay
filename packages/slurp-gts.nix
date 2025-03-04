{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "slurp";
  version = "main";

  src = pkgs.fetchFromGitHub {
    owner = "VyrCossont";
    repo = pname;
    rev = "2092d519d1e3034582dbe48c01f2c86fe5f6312f";
    hash = "sha256-L5p9ydgjhb207leC9QPxwQMGg0F6vonUbCnNpSpw+rg=";
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
