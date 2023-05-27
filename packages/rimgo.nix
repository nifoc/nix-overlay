{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "rimgo";
  version = "2023-05-26";

  src = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "video-prize-ranch";
    repo = pname;
    rev = "f0188614b055b6f5d295c46f72ad162d0daa5ac3";
    sha256 = "sha256-EWsx7FUkdSjZmhmJ+KZhswU94jez5dfrUaD3SyX0RI4=";
  };

  vendorSha256 = "sha256-qfWYDfIdkZ1pHV97OTv0M8Qi8+2diNUuJmorQMX91AI=";

  meta = with lib; {
    description = "An alternative frontend for Imgur.";
    homepage = "https://codeberg.org/video-prize-ranch/rimgo";
    license = [ licenses.agpl3 ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
