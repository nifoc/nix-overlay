{
  lib,
  fetchFromGitHub,
  stdenv,
  buildPythonApplication,
  setuptools,
  defusedxml,
  python-dateutil,
  requests,
  xxhash,
}:

buildPythonApplication rec {
  pname = "fedifetcher";
  version = "8.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nanos";
    repo = "FediFetcher";
    tag = "v${version}";
    hash = "sha256-RjJzO1+6lbecv07AmBHqEfi0HMlAi576Xx5jw/Avh2E=";
  };

  buildInputs = [ setuptools ];

  propagatedBuildInputs = [
    defusedxml
    python-dateutil
    requests
    xxhash
  ];

  checkPhase = lib.optionalString (stdenv.buildPlatform.canExecute stdenv.hostPlatform) ''
    runHook preCheck
    $out/bin/fedifetcher --help>/dev/null
    runHook postCheck
  '';

  meta = {
    description = "Tool for Mastodon that automatically fetches missing replies and posts from other fediverse instances";
    longDescription = ''
      FediFetcher is a tool for Mastodon that automatically fetches missing
      replies and posts from other fediverse instances, and adds them to your
      own Mastodon instance.
    '';
    homepage = "https://blog.thms.uk/fedifetcher";
    changelog = "https://github.com/nanos/FediFetcher/releases/tag/${src.tag}";
    license = lib.licenses.mit;
    mainProgram = "fedifetcher";
  };
}
