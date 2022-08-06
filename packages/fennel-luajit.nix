{ system, lib, pkgs }:

pkgs.fennel.overrideAttrs (
  let
    luaPackages = with pkgs.luajitPackages; [ readline ];
  in
  o: rec {
    buildInputs = [ pkgs.luajit pkgs.makeWrapper ] ++ luaPackages;

    postInstall = o.postInstall or "" + ''
      wrapProgram $out/bin/fennel \
        --suffix LUA_CPATH ";" "${lib.concatMapStringsSep ";" pkgs.luajitPackages.getLuaCPath luaPackages}" \
        --suffix LUA_PATH ";" "${lib.concatMapStringsSep ";" pkgs.luajitPackages.getLuaPath luaPackages}"
    '';
  }
)
