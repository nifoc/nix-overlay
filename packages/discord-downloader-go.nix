{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "discord-downloader-go";
  version = "2.6.1";

  src = pkgs.fetchFromGitHub {
    owner = "get-got";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-yjM9st3UNc//kcJfCYIJcRIoer6ID+zpPCxHKNY71gM=";
  };

  vendorHash = "sha256-DZU1UiBneK+nzz29Dno9gcGRx1AzWGdqZt7nzTC/S8I=";

  doCheck = false;

  meta = with lib; {
    description = "A Discord bot program to download and otherwise handle files sent in Discord channels with extensive configuration.";
    homepage = "https://github.com/get-got/discord-downloader-go";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
    mainProgram = "discord-downloader-go";
  };
}
