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
  version = "1.3.0";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "rootshell-labs";
    repo = "octodns-desec";
    tag = "${version}";
    hash = "sha256-tRviqrNkKYWj4a3EWCJEco8AnzFuRkvSCzZ1HrSye/I=";
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
