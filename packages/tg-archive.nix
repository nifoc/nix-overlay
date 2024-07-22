{ pkgs, lib }:

pkgs.python3.pkgs.buildPythonApplication rec {
  pname = "tg-archive";
  version = "1.2.0";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "knadh";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-wAVfq/rsMAI/Hwqt61PrKAPNppP7R1nn6Xsjx5xx8Fo=";
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
