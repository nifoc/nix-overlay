{ pkgs, lib }:

let
  python = pkgs.python310;
in
python.pkgs.buildPythonApplication rec {
  pname = "tg-archive";
  version = "1.3.0";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "knadh";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-/b9LmHOyFqaKiQ5FHemLmg6DZU+3zzh1jLBEI7RTu4Q=";
  };

  nativeBuildInputs = with python.pkgs; [
    setuptools
    wheel
  ];

  propagatedBuildInputs = with python.pkgs; [
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
