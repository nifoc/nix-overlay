{ pkgs, lib }:

pkgs.stdenvNoCC.mkDerivation rec {
  pname = "phantomjs";
  version = "2.1.1";

  src = pkgs.fetchurl {
    url = "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${version}-macosx.zip";
    sha256 = "U4z0iCGasn4wnq/GKeK87pl2mQ/pCx7DNPVBd5FQ+ME=";
  };

  nativeBuildInputs = with pkgs; [ unzip ];

  unpackPhase = ''
    unzip $src
  '';

  dontStrip = true;

  installPhase = ''
    runHook preInstall
    install -D phantomjs-${version}-macosx/bin/phantomjs $out/bin/phantomjs
    runHook postInstall
  '';

  doInstallCheck = true;

  installCheckPhase = ''
    $out/bin/phantomjs --version
  '';

  meta = with lib; {
    description = "Scriptable Headless WebKit";
    homepage = "https://github.com/ariya/phantomjs";
    license = licenses.bsd3;
    platforms = [ "x86_64-darwin" ];
  };
}
