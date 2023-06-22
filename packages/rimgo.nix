{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "rimgo";
  version = "2023-06-19";

  src = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "video-prize-ranch";
    repo = pname;
    rev = "64908fb75db8dd3a31aa7b5eaee3542528c2417d";
    sha256 = "sha256-/61x+fWgia3/+SllCkZJTBhjK56+8q3b4tguspaiFqA=";
  };

  vendorSha256 = "sha256-iZ5mCDcLHHAESPwYLYl2eSoJ7UASP3UwKKwCtIdokcs=";

  nativeBuildInputs = [ pkgs.nodePackages.tailwindcss ];

  preBuild = ''
    tailwindcss -i static/tailwind.css -o static/app.css -m
  '';

  meta = with lib; {
    description = "An alternative frontend for Imgur.";
    homepage = "https://codeberg.org/video-prize-ranch/rimgo";
    license = [ licenses.agpl3 ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
