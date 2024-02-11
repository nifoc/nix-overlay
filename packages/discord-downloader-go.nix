{ pkgs, lib }:

pkgs.buildGo121Module rec {
  pname = "discord-downloader-go";
  version = "2.5.2-dev";

  src = pkgs.fetchFromGitHub {
    owner = "get-got";
    repo = pname;
    rev = "34c2e1e044b90817a422ace40711ee89c65b162f";
    hash = "sha256-Zdxm42T4sXhhiWZaVdT1pTvmFNsmhcK5ph1S7JHZ6XQ=";
  };

  vendorHash = "sha256-B//+f+jQMW5fj7aeyyi6DvTed40jvc7fxsgToIK0T3w=";

  doCheck = false;

  meta = with lib; {
    description = "A Discord bot program to download and otherwise handle files sent in Discord channels with extensive configuration.";
    homepage = "https://github.com/get-got/discord-downloader-go";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
    mainProgram = "discord-downloader-go";
  };
}
