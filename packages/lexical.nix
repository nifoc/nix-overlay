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
  pname = "lexical";
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

  installPhase = ''
    runHook preInstall

    mix release lexical --no-deps-check --path "$out"
    rm "$out/start_lexical.sh"

    runHook postInstall
  '';

  preFixup = ''
    for script in $out/releases/*/elixir; do
      substituteInPlace "$script" --replace 'ERL_EXEC="erl"' 'ERL_EXEC="${erlang}/bin/erl"'
    done

    wrapProgram $out/bin/lexical --set RELEASE_COOKIE lexical
  '';
}
