{ pkgs, lib }:

let
  erlang = pkgs.beam.interpreters.erlangR26;
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
  version = "0.4.1";

  src = pkgs.fetchFromGitHub {
    owner = "lexical-lsp";
    repo = "lexical";
    rev = "v${version}";
    sha256 = "sha256-X9oXx7+BjsfzVpPwZeI9ezuwHGDyvrSx940LsR6Mw8A=";
  };

  mixFodDeps = beamPackages.fetchMixDeps {
    pname = "mix-deps-${pname}";
    inherit src version;
    sha256 = "sha256-SQiXUjHmvtXUbHpPI1WSqsvPCauw+wiQmuwqUXOOscM=";
  };

  NAMESPACE = "1";

  installPhase = ''
    runHook preInstall

    mix do compile --no-deps-check, package --path "$out"

    runHook postInstall
  '';

  preFixup = ''
    for script in $out/releases/*/elixir; do
      substituteInPlace "$script" --replace 'ERL_EXEC="erl"' 'ERL_EXEC="${erlang}/bin/erl"'
    done

    makeWrapper $out/bin/start_lexical.sh $out/bin/lexical --set RELEASE_COOKIE lexical
  '';
}
