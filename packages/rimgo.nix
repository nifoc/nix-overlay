{ system, lib, pkgs }:

pkgs.buildGoModule rec {
  pname = "rimgo";
  version = "2023-03-14";

  src = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "video-prize-ranch";
    repo = pname;
    rev = "4e065bf455bd16826a07026c30d6f160174d1dde";
    hash = "sha256-uUabhiMdlMX06Cq3DmKL8AH9I4TwJrV7FSCKalgpkcU=";
  };

  vendorSha256 = "sha256-7oArN4V8gvDZJJ/1A9kVz/d/U9Nd69duH+oUSX7TgE0=";

  meta = with lib; {
    description = "An alternative frontend for Imgur.";
    homepage = "https://codeberg.org/video-prize-ranch/rimgo";
    license = [ licenses.agpl3 ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
