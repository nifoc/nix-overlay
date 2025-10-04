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
    owner = "rootshell-labs";
    repo = "octodns-desec";
    tag = "${version}";
    hash = "sha256-SQadWTaLWsPM2ZVFnr25025/Ik/RjQ0lfIZY4cT78pM=";
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
