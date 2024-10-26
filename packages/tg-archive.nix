{ pkgs, lib }:

pkgs.python3.pkgs.buildPythonApplication rec {
  pname = "tg-archive";
  version = "1.2.2";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "knadh";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-baosQnA67+v0XxGrXEYjGGsKCBj1uRcYgfKkqO2GST4=";
  };

  nativeBuildInputs = with pkgs.python3.pkgs; [
    setuptools
    wheel
  ];

  propagatedBuildInputs = with pkgs.python3.pkgs; [
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
