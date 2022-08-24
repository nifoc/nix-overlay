{ system, lib, pkgs }:

pkgs.lua51Packages.buildLuarocksPackage rec {
  pname = "jsregexp";
  version = "0.0.5";
  rockspecFilename = "./${pname}-${version}-1.rockspec";

  src = pkgs.fetchFromGitHub {
    owner = "kmarius";
    repo = pname;
    rev = "3f8942325ba720b4173e6370a47d5a0529da2efb";
    sha256 = "sha256-WlPWp3iJRZH5CfQohD81qIrE1KRbBOZWvFUU7LjEkq0=";
  };

  meta = with lib; {
    description = "javascript (ECMA19) regular expressions for lua(snip)";
    homepage = "https://github.com/kmarius/jsregexp";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
