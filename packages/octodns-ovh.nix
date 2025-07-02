{ pkgs, lib, buildPythonPackage, setuptools, ovh, requests, pytestCheckHook, requests-mock }:

buildPythonPackage rec {
  pname = "octodns-ovh";
  version = "1.1.0";
  pyproject = true;

  src = pkgs.fetchFromGitHub {
    owner = "octodns";
    repo = "octodns-ovh";
    tag = "v${version}";
    hash = "sha256-UbxOdpG099G9oKyweIMH5JTP0W0MpLmsOWgQYEFD8sQ=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    pkgs.octodns
    ovh
    requests
  ];

  env.OCTODNS_RELEASE = 1;

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
