{ pkgs, lib }:

pkgs.python3.pkgs.buildPythonApplication rec {
  pname = "bulk-downloader-for-reddit";
  version = "2023-10-02";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "aliparlakci";
    repo = pname;
    rev = "8e6103952c4be3ccadfe29d3a0cae7a4d0b2c426";
    hash = "sha256-kxCDtOywDSMxI+h8Ad2eziAGcZLbZHJFpDD/87BIbZY=";
  };

  patches = [
    ../patches/bulk-downloader-for-reddit_recursion-limit.patch
  ];

  nativeBuildInputs = with pkgs.python3.pkgs; [
    setuptools
    wheel
  ];

  propagatedBuildInputs = with pkgs.python3.pkgs; [
    appdirs
    beautifulsoup4
    cachetools
    click
    dict2xml
    praw
    pyyaml
    requests
    yt-dlp

    pkgs.ffmpeg-headless
  ];
}
