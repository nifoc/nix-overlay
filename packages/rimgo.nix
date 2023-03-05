{ system, lib, pkgs }:

pkgs.buildGoModule rec {
  pname = "rimgo";
  version = "2023-02-25";

  src = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "video-prize-ranch";
    repo = pname;
    rev = "c6a9ca3443e5ab9b9794c99cd349112c926462a1";
    hash = "sha256-vHOITcSrGNz+1lw+9RIBssi0RjqOTpVb7Z+Yvj3AD0I=";
  };

  vendorSha256 = "sha256-T2zcQB9jOldnB+0rYsTSAhjrL77Hk+oHpKecS7h2U2c=";

  meta = with lib; {
    description = "An alternative frontend for Imgur.";
    homepage = "https://codeberg.org/video-prize-ranch/rimgo";
    license = [ licenses.agpl3 ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
