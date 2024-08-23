{ pkgs, lib }:

pkgs.python3.pkgs.buildPythonApplication rec {
  pname = "tg-archive";
  version = "1.2.1";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "knadh";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-msgF4sSd8bvwN2+CK4xeaKaXGduChDNw8qQrT9lpfyk=";
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
