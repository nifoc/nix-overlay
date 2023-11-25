{ pkgs, lib, ... }:

pkgs.tabnine.overrideAttrs (
  oa: rec {
    # https://update.tabnine.com/bundles/version
    version = "4.49.0";

    src = pkgs.fetchurl {
      url = "https://update.tabnine.com/bundles/${version}/aarch64-apple-darwin/TabNine.zip";
      sha256 = "0wrzbv2mam83visp322vwg98f63wcxxwlwm5rzwyd0psgqmgjkb3";
    };

    meta = with lib; {
      homepage = "https://tabnine.com";
      description = "Smart Compose for code that uses deep learning to help you write code faster";
      license = licenses.unfree;
      platforms = [ "aarch64-darwin" ];
    };
  }
)
