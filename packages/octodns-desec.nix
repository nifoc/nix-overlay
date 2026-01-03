{
  pkgs,
  lib,
  buildPythonPackage,
  setuptools,
  octodns,
  requests,
  pytestCheckHook,
  requests-mock,
}:

buildPythonPackage rec {
  pname = "octodns-desec";
  version = "1.1.0";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "nifoc";
    repo = "octodns-desec";
    rev = "59fcbdf611f85c5108cd9713b190a5e575faed42";
    # tag = "${version}";
    hash = "sha256-SqiP2di0WmzG+CGe6+UslUb5ShG4eDIfs3bf5kpIf3o=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    octodns
    requests
  ];

  pythonImportsCheck = [ "octodns_desec" ];

  nativeCheckInputs = [
    pytestCheckHook
    requests-mock
  ];

  meta = {
    description = "deSEC.io API provider for octoDNS";
    homepage = "https://github.com/rootshell-labs/octodns-desec/";
    changelog = "https://github.com/rootshell-labs/octodns-desec/blob/${version}/CHANGELOG.md";
    license = lib.licenses.mit;
  };
}
