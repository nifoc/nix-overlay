{
  pkgs,
  lib,
  buildPythonApplication,
  setuptools,
  wheel,
  praw,
  appdirs,
  beautifulsoup4,
  cachetools,
  click,
  dict2xml,
  pyyaml,
  requests,
  yt-dlp,
}:

buildPythonApplication rec {
  pname = "bulk-downloader-for-reddit";
  version = "2.6.2-unstable-2024-11-14";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "Serene-Arc";
    repo = pname;
    rev = "b5b47f93e8380c9ef576eb52cd4c80d2fadf905a";
    hash = "sha256-Tt1uWoS4VUnoVGKCgkLxXB8Sf4N1Z4U/5wirajB3nPg=";
  };

  patches = [
    ../patches/bulk-downloader-for-reddit_recursion-limit.patch
    ../patches/bulk-downloader-for-reddit_imgur-headers.patch
    ../patches/bulk-downloader-for-reddit_imgur-album-images-none.patch
    ../patches/bulk-downloader-for-reddit_downloader-no-crash-on-chunkedencodingerror.patch
    ../patches/bulk-downloader-for-reddit_ytdl-add-optional-support-for-a-netrc-file.patch
  ];

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs =
    let
      praw-old = praw.overrideAttrs (
        _: previousAttrs: {
          version = "7.7.1";
          pyproject = true;

          nativeBuildInputs = previousAttrs.nativeBuildInputs ++ [ setuptools ];

          src = pkgs.fetchFromGitHub {
            owner = "praw-dev";
            repo = previousAttrs.pname;
            rev = "refs/tags/v${version}";
            hash = "sha256-L7wTHD/ypXVc8GMfl9u16VNb9caLJoXpaMEIzaVVUgo=";
          };
        }
      );
    in
    [
      appdirs
      beautifulsoup4
      cachetools
      click
      dict2xml
      praw-old
      pyyaml
      requests
      yt-dlp

      pkgs.ffmpeg-headless
    ];
}
