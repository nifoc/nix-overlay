{
  lib,
  fetchFromGitHub,
  stdenv,
  buildPythonApplication,
  defusedxml,
  python-dateutil,
  requests,
  xxhash,
}:

buildPythonApplication rec {
  pname = "fedifetcher";
  version = "7.1.18";
  format = "other";

  src = fetchFromGitHub {
    owner = "nanos";
    repo = "FediFetcher";
    tag = "v${version}";
    hash = "sha256-6eR29MmePp3tOM7higRfSfVJFWmsnXHVPZs1CQ8ULAc=";
  };

  propagatedBuildInputs = [
    defusedxml
    python-dateutil
    requests
    xxhash
  ];

  installPhase = ''
    runHook preInstall
    install -vD find_posts.py $out/bin/fedifetcher
    runHook postInstall
  '';

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
