{ pkgs, lib, buildPythonApplication, setuptools, wheel, cryptg, feedgen, jinja2, telethon, pillow, python-magic, pysocks, pytz, pyyaml }:

buildPythonApplication rec {
  pname = "tg-archive";
  version = "1.3.0";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "knadh";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-/b9LmHOyFqaKiQ5FHemLmg6DZU+3zzh1jLBEI7RTu4Q=";
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
