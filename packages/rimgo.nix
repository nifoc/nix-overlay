{ system, lib, pkgs }:

pkgs.buildGoModule rec {
  pname = "rimgo";
  version = "2023-03-08";

  src = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "video-prize-ranch";
    repo = pname;
    rev = "30f5fdcbf29cfa86c439c759078697cb295eaf4d";
    hash = "sha256-JaMTgCAQutjGe2t5uGMi84ocVrlFOPh3iFqm4a8Tkv4=";
  };

  vendorSha256 = "sha256-7oArN4V8gvDZJJ/1A9kVz/d/U9Nd69duH+oUSX7TgE0=";

  meta = with lib; {
    description = "An alternative frontend for Imgur.";
    homepage = "https://codeberg.org/video-prize-ranch/rimgo";
    license = [ licenses.agpl3 ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
