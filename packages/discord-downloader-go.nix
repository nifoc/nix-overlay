{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "discord-downloader-go";
  version = "2.5.3";

  src = pkgs.fetchFromGitHub {
    owner = "get-got";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-WmVOrJz1hqxP/8hLEZmeNsd0ySNI468r8J7nkE7yJIo=";
  };

  vendorHash = "sha256-Wwm0VejxE6FvHpAWpXlvEcxQQlHZiFM09yjOeSO8Dhg=";

  doCheck = false;

  meta = with lib; {
    description = "A Discord bot program to download and otherwise handle files sent in Discord channels with extensive configuration.";
    homepage = "https://github.com/get-got/discord-downloader-go";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
    mainProgram = "discord-downloader-go";
  };
}
