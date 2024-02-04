{ pkgs, lib }:

pkgs.buildGo121Module rec {
  pname = "discord-downloader-go";
  version = "2.4.0";

  src = pkgs.fetchFromGitHub {
    owner = "get-got";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-83B+sFnDE3tDdDT+4C1Sqf3zNN4J+gz0g55yDiV5ngg=";
  };

  vendorHash = "sha256-2czUty8sh2CJxukIE77RrlCHNfhB3qUYmFAUy/ehz6s=";

  doCheck = false;

  meta = with lib; {
    description = "A Discord bot program to download and otherwise handle files sent in Discord channels with extensive configuration.";
    homepage = "https://github.com/get-got/discord-downloader-go";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
