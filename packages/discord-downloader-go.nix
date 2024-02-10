{ pkgs, lib }:

pkgs.buildGo121Module rec {
  pname = "discord-downloader-go";
  version = "2.5.0-dev";

  src = pkgs.fetchFromGitHub {
    owner = "get-got";
    repo = pname;
    rev = "837c9792182d94863fdfdda8f18db68407fb3df9";
    hash = "sha256-pypkbDoinrRJxfTaVv2mKKMRXUqKIkW7xZJtRjSKtAM=";
  };

  vendorHash = "sha256-B//+f+jQMW5fj7aeyyi6DvTed40jvc7fxsgToIK0T3w=";

  doCheck = false;

  meta = with lib; {
    description = "A Discord bot program to download and otherwise handle files sent in Discord channels with extensive configuration.";
    homepage = "https://github.com/get-got/discord-downloader-go";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
