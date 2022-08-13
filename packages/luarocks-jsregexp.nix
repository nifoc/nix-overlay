{ system, lib, pkgs }:

pkgs.lua51Packages.buildLuarocksPackage rec {
  pname = "jsregexp";
  version = "0.0.4";
  rockspecFilename = "./${pname}-${version}-1.rockspec";

  src = pkgs.fetchFromGitHub {
    owner = "kmarius";
    repo = pname;
    rev = "c5d9a0c5924937fe92f9cfcac3ccc1e798d164d7";
    sha256 = "sha256-20GUkwoR71M5pCD4jFUPRbIoMYHzbg7W2rZxBy4SpP8=";
  };

  meta = with lib; {
    description = "javascript (ECMA19) regular expressions for lua(snip)";
    homepage = "https://github.com/kmarius/jsregexp";
    license = [ licenses.mit ];
    platforms = [ "x86_64-darwin" "aarch64-darwin" "aarch64-linux" "x86_64-linux" ];
  };
}
