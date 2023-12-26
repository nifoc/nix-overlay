{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "rimgo";
  version = "2023-08-16";

  src = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "video-prize-ranch";
    repo = pname;
    rev = "877ee7faa935aa1073dd21260f19952e018df416";
    sha256 = "sha256-M40YS3T69sUzbEclr9jIl/6cJWmlvKYAsNcafaakWmg=";
  };

  vendorHash = "sha256-u5N7aI9RIQ3EmiyHv0qhMcKkvmpp+5G7xbzdQcbhybs=";

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
