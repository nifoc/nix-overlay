{ pkgs, lib, ... }:

pkgs.tabnine.overrideAttrs (
  oa: rec {
    # https://update.tabnine.com/bundles/version
    version = "4.53.0";

    src = pkgs.fetchurl {
      url = "https://update.tabnine.com/bundles/${version}/aarch64-apple-darwin/TabNine.zip";
      sha256 = "01c1rxf6k5wv4758g9m8n6mngp07kr8xbskb5liz1x8cljcs6f72";
    };

    meta = with lib; {
      homepage = "https://tabnine.com";
      description = "Smart Compose for code that uses deep learning to help you write code faster";
      license = licenses.unfree;
      platforms = [ "aarch64-darwin" ];
    };
  }
)
