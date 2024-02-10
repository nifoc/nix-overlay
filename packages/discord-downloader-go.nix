{ pkgs, lib }:

pkgs.buildGo121Module rec {
  pname = "discord-downloader-go";
  version = "2.5.0-dev";

  src = pkgs.fetchFromGitHub {
    owner = "get-got";
    repo = pname;
    rev = "0993bcefa24d49c36d50b5fcbb101c73edbf5fd3";
    hash = "sha256-0evA6dc+4JUdkgM0MUqBTJ1SUerUvGAB9/on+4/9jKY=";
  };

  vendorHash = "sha256-7H42mz2GxSg3/dw92lX+HHxEHdJp/0AoIbUEGN3JX9c=";

  doCheck = false;

  meta = with lib; {
    description = "A Discord bot program to download and otherwise handle files sent in Discord channels with extensive configuration.";
    homepage = "https://github.com/get-got/discord-downloader-go";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
