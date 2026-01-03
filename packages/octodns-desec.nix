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
    rev = "391d7ca1925cab07c360bba972a0f72dd2fbd6de";
    # tag = "${version}";
    hash = "sha256-edIYoGLzDtHCCJT2bFAlhimnp9gakui4MD2p5P9cxRg=";
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
