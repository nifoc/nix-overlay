{ pkgs, lib }:

pkgs.buildGoModule rec {
  pname = "discord-downloader-go";
  version = "2.6.0";

  src = pkgs.fetchFromGitHub {
    owner = "get-got";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-vcFSOFgKMmhZURfU73DB4YLQMzpGMWkAvWEbkf2sFts=";
  };

  vendorHash = "sha256-M5QCY0CFf9kqNsrhu7S3sDctfp4suWw7V8Cqt0ZK1MQ=";

  doCheck = false;

  meta = with lib; {
    description = "A Discord bot program to download and otherwise handle files sent in Discord channels with extensive configuration.";
    homepage = "https://github.com/get-got/discord-downloader-go";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
    mainProgram = "discord-downloader-go";
  };
}
