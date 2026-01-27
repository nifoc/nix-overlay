{ pkgs, lib, buildPythonApplication, setuptools, wheel, cryptg, feedgen, jinja2, telethon, pillow, python-magic, pysocks, pytz, pyyaml }:

buildPythonApplication rec {
  pname = "tg-archive";
  version = "1.3.1";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "knadh";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-GAy3dKkrrLO9IlRBUYaKxm4AswQK4cYUKIjezcBok/k=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    cryptg
    feedgen
    jinja2
    telethon
    pillow
    python-magic
    pysocks
    pytz
    pyyaml
  ];

  dontCheckRuntimeDeps = true;
}
