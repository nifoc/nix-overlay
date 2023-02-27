{ system, lib, pkgs }:

pkgs.lua51Packages.buildLuarocksPackage rec {
  pname = "jsregexp";
  version = "0.0.6";
  rockspecFilename = "./${pname}-${version}-1.rockspec";

  src = pkgs.fetchFromGitHub {
    owner = "kmarius";
    repo = pname;
    rev = "b096131504f5d2842fe225d40eb5a9eccca7db27";
    hash = "sha256-T47r87FtrFnEw+a1CguqtPr3Wt/04M1xwLYw00K8aOQ=";
  };

  meta = with lib; {
    description = "javascript (ECMA19) regular expressions for lua(snip)";
    homepage = "https://github.com/kmarius/jsregexp";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
