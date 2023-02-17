{ system, lib, pkgs }:

# Quick and dirty copy of the nixpkgs file: https://github.com/NixOS/nixpkgs/blob/777bc8162088e120fa14638265697fa4394fbe79/pkgs/applications/terminal-emulators/wezterm/default.nix

pkgs.rustPlatform.buildRustPackage rec {
  pname = "wezterm";
  version = "unstable-2023-02-12";

  src = pkgs.fetchFromGitHub {
    owner = "wez";
    repo = pname;
    rev = "a5c2b1f3adb06054bf522cb3d350697938d6f8e9";
    fetchSubmodules = true;
    sha256 = "sha256-jQK8mSQGBztzSFYNGeL5TP2xUY6Xd4FaLkVvBahpzRY=";
  };

  postPatch = ''
    echo ${version} > .tag
    # tests are failing with: Unable to exchange encryption keys
    rm -r wezterm-ssh/tests
  '';

  cargoSha256 = "sha256-lO9EMhRV6uf85N24vZo/CNcHzl70VFt9CP69enGQnpY=";

  nativeBuildInputs = with pkgs; [
    installShellFiles
    ncurses # tic for terminfo
    pkg-config
    python3
  ] ++ lib.optional stdenv.isDarwin perl;

  buildInputs = with pkgs; [
    fontconfig
    zlib
  ] ++ lib.optionals stdenv.isDarwin (with pkgs.darwin.apple_sdk.frameworks; [
    Cocoa
    CoreGraphics
    Foundation
    libiconv
    UserNotifications
  ]);

  buildFeatures = [ "distro-defaults" ];

  postInstall = ''
    mkdir -p $out/nix-support
    echo "${passthru.terminfo}" >> $out/nix-support/propagated-user-env-packages
    install -Dm644 assets/icon/terminal.png $out/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png
    install -Dm644 assets/wezterm.desktop $out/share/applications/org.wezfurlong.wezterm.desktop
    install -Dm644 assets/wezterm.appdata.xml $out/share/metainfo/org.wezfurlong.wezterm.appdata.xml
    install -Dm644 assets/shell-integration/wezterm.sh -t $out/etc/profile.d
    installShellCompletion --cmd wezterm \
      --bash assets/shell-completion/bash \
      --fish assets/shell-completion/fish \
      --zsh assets/shell-completion/zsh
    install -Dm644 assets/wezterm-nautilus.py -t $out/share/nautilus-python/extensions
  '';

  preFixup = lib.optionalString pkgs.stdenv.isDarwin ''
    mkdir -p "$out/Applications"
    OUT_APP="$out/Applications/WezTerm.app"
    cp -r assets/macos/WezTerm.app "$OUT_APP"
    rm $OUT_APP/*.dylib
    cp -r assets/shell-integration/* "$OUT_APP"
    ln -s $out/bin/{wezterm,wezterm-mux-server,wezterm-gui,strip-ansi-escapes} "$OUT_APP"
  '';

  passthru = {
    terminfo = pkgs.runCommand "wezterm-terminfo"
      {
        nativeBuildInputs = with pkgs; [
          ncurses
        ];
      } ''
      mkdir -p $out/share/terminfo $out/nix-support
      tic -x -o $out/share/terminfo ${src}/termwiz/data/wezterm.terminfo
    '';
  };

  meta = with lib; {
    description = "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust";
    homepage = "https://wezfurlong.org/wezterm";
    license = licenses.mit;
    platforms = [ "x86_64-darwin" "aarch64-darwin" ];
  };
}