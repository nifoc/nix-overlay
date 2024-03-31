{ pkgs, lib }:

let
  erlang = pkgs.beam.interpreters.erlangR26;
  beamPackages = pkgs.beam.packagesWith erlang;
in
beamPackages.mixRelease rec {
  pname = "lexical";
  version = "0.5.2";

  src = pkgs.fetchFromGitHub {
    owner = "lexical-lsp";
    repo = "lexical";
    rev = "v${version}";
    hash = "sha256-HWqwJ7PAz80bm6YeDG84hLWPE11n06K98GOyeDQWZWU=";
  };

  mixFodDeps = beamPackages.fetchMixDeps {
    pname = "mix-deps-${pname}";
    inherit src version;
    sha256 = "sha256-oxR56mzV0uRs40j5N+bU1QDMXTYnJ789cUoOG462KtI=";
  };

  NAMESPACE = "1";

  installPhase = ''
    runHook preInstall

    mix do compile --no-deps-check, package --path "$out"

    runHook postInstall
  '';

  preFixup =
    let
      activate_version_manager = pkgs.writeScript "activate_version_manager.sh" ''
        true
      '';
    in
    ''
      substituteInPlace "$out/bin/start_lexical.sh" --replace 'elixir_command=' 'elixir_command="${beamPackages.elixir}/bin/"'
      rm "$out/bin/activate_version_manager.sh"
      ln -s ${activate_version_manager} "$out/bin/activate_version_manager.sh"

      mv "$out/bin" "$out/binsh"

      makeWrapper "$out/binsh/start_lexical.sh" "$out/bin/lexical" --set RELEASE_COOKIE lexical
    '';
}
