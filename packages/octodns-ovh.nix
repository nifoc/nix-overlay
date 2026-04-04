{
  pkgs,
  lib,
  buildPythonPackage,
  setuptools,
  octodns,
  ovh,
  requests,
  pytestCheckHook,
  requests-mock,
}:

buildPythonPackage rec {
  pname = "octodns-ovh";
  version = "1.2.0";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "octodns";
    repo = "octodns-ovh";
    tag = "v${version}";
    hash = "sha256-XNwrne+NTriByEmP9JGGWcymDT42lryWtSEcuGdJiXU=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    octodns
    ovh
    requests
  ];

  pythonImportsCheck = [ "octodns_ovh" ];

  nativeCheckInputs = [
    pytestCheckHook
    requests-mock
  ];

  disabledTests = [ "test_apply" ];

  meta = {
    description = "OVH API provider for octoDNS";
    homepage = "https://github.com/octodns/octodns-ovh/";
    changelog = "https://github.com/octodns/octodns-ovh/blob/${version}/CHANGELOG.md";
    license = lib.licenses.mit;
  };
}
