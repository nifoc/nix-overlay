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
  version = "2.6.2-unstable-2026-02-01";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "Serene-Arc";
    repo = pname;
    rev = "014e0f68e5303320ac9edd13e05696c8eca333cf";
    hash = "sha256-pAGe8bov2faIQjdzwpz8x4JyA4vfgyRCkwEWK+qV6bI=";
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
