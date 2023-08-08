{ pkgs, lib }:

let
  erlang = pkgs.beam.interpreters.erlangR25;
  beamPackagesPrev = pkgs.beam.packagesWith erlang;
  elixir = beamPackagesPrev.elixir_1_15;

  beamPackages = beamPackagesPrev // rec {
    inherit erlang elixir;
    hex = beamPackagesPrev.hex.override { inherit elixir; };
    buildMix = beamPackagesPrev.buildMix.override { inherit elixir erlang hex; };
    mixRelease = beamPackagesPrev.mixRelease.override { inherit erlang elixir; };
    fetchMixDeps = beamPackagesPrev.fetchMixDeps.override { inherit elixir; };
  };
in
beamPackages.mixRelease rec {
  pname = "lexical-ls";
  version = "0.2.2";

  src = pkgs.fetchFromGitHub {
    owner = "lexical-lsp";
    repo = "lexical";
    rev = "9f89426a38de8e90cbf352396641226f3a7a6c17";
    sha256 = "sha256-t4a5mq5lUCU6uWgN0/hCCuPvyqVksUTjSu8Ajw+9tHA=";
  };

  mixFodDeps = beamPackages.fetchMixDeps {
    pname = "mix-deps-${pname}";
    inherit src version;
    sha256 = "sha256-a715z1ti1J0kKzLcIS1UuFpPAMEx2VlFpkmZrRTSWh4=";
  };

  NAMESPACE = "1";

  configurePhase = ''
    runHook preConfigure
    mix deps.compile --no-deps-check
    runHook postConfigure
  '';

  installPhase = ''
    runHook preInstall

    mix release lexical --no-deps-check --path "$out"
    rm "$out/start_lexical.sh"
    mv "$out/bin/lexical" "$out/bin/lexical-nocookie"

    cat > "$out/bin/lexical" << EOF
    #!${pkgs.bash}/bin/bash

    RELEASE_COOKIE=${pname}
    export RELEASE_COOKIE

    exec -a "$0" "$out/bin/lexical-nocookie" start "$@"
    EOF
    chmod +x "$out/bin/lexical"

    runHook postInstall
  '';
}
