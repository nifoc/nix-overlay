{ pkgs, lib }:

let
  python = pkgs.python310;
in
python.pkgs.buildPythonApplication rec {
  pname = "bulk-downloader-for-reddit";
  version = "development";
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
  ];

  nativeBuildInputs = with python.pkgs; [
    setuptools
    wheel
  ];

  propagatedBuildInputs =
    let
      praw = python.praw.overrideAttrs (_: previousAttrs: {
        version = "7.7.1";
        pyproject = true;

        nativeBuildInputs = previousAttrs.nativeBuildInputs ++ [ python.pkgs.setuptools ];

        src = pkgs.fetchFromGitHub {
          owner = "praw-dev";
          repo = previousAttrs.pname;
          rev = "refs/tags/v${version}";
          hash = "sha256-L7wTHD/ypXVc8GMfl9u16VNb9caLJoXpaMEIzaVVUgo=";
        };
      });
    in
    with python.pkgs; [
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
