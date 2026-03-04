{ pkgs }:

pkgs.stdenvNoCC.mkDerivation rec {
  pname = "ai-robots-txt";
  version = "1.45";

  src = pkgs.fetchFromGitHub {
    owner = "ai-robots-txt";
    repo = "ai.robots.txt";
    rev = "v${version}";
    hash = "sha256-HwRsZKQlK0t88Sz7VDQ5qZoufPTfYofZhBQ6EY3jVkg=";
  };

  installPhase = ''
    runHook preInstall

    cp robots.txt robots_generic.txt
    echo "" >> robots_generic.txt
    echo "User-agent: *" >> robots_generic.txt
    echo "Disallow: /" >> robots_generic.txt

    install -D robots.txt $out/share/robots.txt
    install -D robots_generic.txt $out/share/robots_generic.txt

    runHook postInstall
  '';
}
