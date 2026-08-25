{
  pkgs,
  lib,
  stdenv,
  fetchpatch,
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
  curl-cffi,
  ffmpeg-headless,
}:

buildPythonApplication rec {
  pname = "bulk-downloader-for-reddit";
  version = "2.6.2-unstable-2026-04-12";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "Serene-Arc";
    repo = pname;
    rev = "cd336596dc2facf57c35575a42b002b503ed6ec2";
    hash = "sha256-FOT/lxf0iU9EUxCttArjRkItFw0C+Gt6bcIAcb/3mJ0=";
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/Serene-Arc/bulk-downloader-for-reddit/pull/783.patch";
      hash = "sha256-USc4k7RMRun2Cl/AW7RVBdOZYJytITM4YVEEHBPBJqE=";
    })

    (fetchpatch {
      url = "https://github.com/Serene-Arc/bulk-downloader-for-reddit/pull/1011.patch";
      hash = "sha256-P8TYR7Kkh6MGqPGzj5UQ3UIoRJJhfGPsdTzY7P9fmdw=";
    })

    (fetchpatch {
      url = "https://github.com/Serene-Arc/bulk-downloader-for-reddit/pull/1012.diff";
      hash = "sha256-ko+2xuzgurdMSC+5TgF5kRqXkXmnYziN1Zu7OnoukTU=";
    })

    ../patches/bulk-downloader-for-reddit_recursion-limit.patch
    ../patches/bulk-downloader-for-reddit_imgur-headers.patch
    ../patches/bulk-downloader-for-reddit_imgur-album-images-none.patch
    ../patches/bulk-downloader-for-reddit_downloader-no-crash-on-chunkedencodingerror.patch
    ../patches/bulk-downloader-for-reddit_ytdl-add-optional-support-for-a-netrc-file.patch
    ../patches/bulk-downloader-for-reddit_ytdl-add-optional-support-for-cookies-and-imper.patch
    ../patches/bulk-downloader-for-reddit_ytdl-add-cookie-netrc-and-impersonate-options-t.patch
  ];

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    appdirs
    beautifulsoup4
    cachetools
    click
    dict2xml
    praw
    pyyaml
    requests
    yt-dlp

    curl-cffi
    ffmpeg-headless
  ];

  checkPhase = lib.optionalString (stdenv.buildPlatform.canExecute stdenv.hostPlatform) ''
    runHook preCheck
    $out/bin/bdfr --help>/dev/null
    runHook postCheck
  '';
}
