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
  version = "0.3.3";

  src = pkgs.fetchFromGitHub {
    owner = "lexical-lsp";
    repo = "lexical";
    rev = "v${version}";
    sha256 = "sha256-yN5OVQFuxSDWxfgNuZJEYFO3208Ui93qbREylCoSGQs=";
  };

  mixFodDeps = beamPackages.fetchMixDeps {
    pname = "mix-deps-${pname}";
    inherit src version;
    sha256 = "sha256-mHJ9nSL0yAZ5fHIZK7Jnu4U5clGQap8kwwDYb+1VDGo=";
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
