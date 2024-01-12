{ pkgs, lib }:

pkgs.python3.pkgs.buildPythonApplication rec {
  pname = "tg-archive";
  version = "1.1.3";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "knadh";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-mcobB/z+e4LzEbqELWlUzhbdV5RIM2iImeg9JdVQQZc=";
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
}
