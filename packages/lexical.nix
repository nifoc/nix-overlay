{ pkgs, lib }:

let
  erlang = pkgs.beam_nox.interpreters.erlang_26;
  beamPackages = pkgs.beam.packagesWith erlang;
in
beamPackages.mixRelease rec {
  pname = "lexical";
  version = "0.6.0";

  src = pkgs.fetchFromGitHub {
    owner = "lexical-lsp";
    repo = "lexical";
    rev = "v${version}";
    hash = "sha256-20qfzYioR1PhA0ZBcft0nhcwxB95pw5L9zoPLWd7ZIE=";
  };

  mixFodDeps = beamPackages.fetchMixDeps {
    pname = "mix-deps-${pname}";
    inherit src version;
    sha256 = "sha256-lcLANYM18NXvDL/T7eMm+0XDhXI7qo+GOJfxROUoTlo=";
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
