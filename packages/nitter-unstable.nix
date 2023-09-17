{ pkgs, lib }:

let
  sha1 = pkgs.nimPackages.buildNimPackage rec {
    pname = "sha1";
    version = "92ccc58";
    src = pkgs.fetchFromGitHub {
      owner = "onionhammer";
      repo = pname;
      rev = version;
      sha256 = "sha256-tWHouIa6AFRmbvJaMsoWKNZX7bzqd3Je1kJ4rVHb+wM=";
    };
  };

  oauth = pkgs.nimPackages.buildNimPackage rec {
    pname = "oauth";
    version = "b8c163b";
    src = pkgs.fetchFromGitHub {
      owner = "CORDEA";
      repo = pname;
      rev = version;
      sha256 = "sha256-ZQvzIKqTkRbvE28uOoVFGTlVMZy+gQWeyW09K7+nukw=";
    };
    buildInputs = [ sha1 ];
  };
in 
pkgs.nitter.overrideAttrs (
  oa: {
    version = "unstable-2023-09-15";

    src = pkgs.fetchFromGitHub {
      owner = "PrivacyDevel";
      repo = "nitter";
      rev = "e4e7fe5f00efec886e2c0c625df2203f549467a6";
      sha256 = "sha256-aVJXC1xA8ze01cdTO1QLoVrnU98x3C4GpiIOqeqcvXY=";
    };

    buildInputs = oa.buildInputs ++ [ sha1 oauth ];
  }
)
