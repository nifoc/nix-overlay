{ pkgs }:

pkgs.stdenvNoCC.mkDerivation rec {
  pname = "ai-robots-txt";
  version = "1.26";

  src = pkgs.fetchFromGitHub {
    owner = "ai-robots-txt";
    repo = "ai.robots.txt";
    rev = "v${version}";
    hash = "sha256-WsCd55eVgk5Vu+Ld6gLxXdxx0nHfL/feUp/WHCsKNA4=";
  };

  installPhase = ''
    runHook preInstall
    install -D robots.txt $out/share/robots.txt
    runHook postInstall
  '';
}
