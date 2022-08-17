{ system, lib, pkgs }:

let
  osSuffix = if pkgs.stdenv.isDarwin then "macos" else "linux";

  osHash =
    if pkgs.stdenv.isDarwin then
      "00bl5ls0lmcz24xxykjlgr99dx74rcs9ia0hp6xf5hck9239vxik"
    else
      "1vsk66nwp39xbivvawrz50y8y7za4xdclq61pl5ry77dbj8pv6np";
in
pkgs.stdenv.mkDerivation rec {
  pname = "marksman";
  version = "2022-08-15";

  src = pkgs.fetchurl {
    url = "https://github.com/artempyanykh/${pname}/releases/download/${version}/marksman-${osSuffix}";
    sha256 = osHash;
  };

  unpackPhase = ''
    echo "$src is already the binary"
    true
  '';

  dontStrip = true;

  installPhase = ''
    install -D $src $out/bin/marksman
  '';

  doInstallCheck = true;

  installCheckPhase = ''
    $out/bin/marksman --version
  '';

  meta = with lib; {
    description = "Write Markdown with code assist and intelligence in the comfort of your favourite editor";
    homepage = "https://github.com/artempyanykh/marksman";
    license = licenses.mit;
    platforms = [ "x86_64-darwin" "x86_64-linux" ];
  };
}
