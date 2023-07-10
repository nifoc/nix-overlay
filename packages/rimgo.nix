{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "rimgo";
  version = "2023-07-06";

  src = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "video-prize-ranch";
    repo = pname;
    rev = "ed21e8293e5e69b0bd5b58e5a5f054893f30bc34";
    sha256 = "sha256-jlBvguaCFf4EnQJL959/pEh2TlA/KTDvh/q9CSghIt4=";
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
