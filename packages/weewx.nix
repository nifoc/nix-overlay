{
  pkgs,
  lib,
  poetry2nix,
  python,
  # build
  cachecontrol,
  cleo,
  crashtest,
  dulwich,
  fastjsonschema,
  keyring,
  pexpect,
  pkginfo,
  platformdirs,
  poetry-core,
  requests-toolbelt,
  shellingham,
  tomlkit,
  trove-classifiers,
  virtualenv,
  xattr,
  # runtime
  paho-mqtt,
  requests,
}:

let
  weewx = pkgs.fetchFromGitHub {
    owner = "weewx";
    repo = "weewx";
    rev = "v5.1.0";
    hash = "sha256-o1Dyo0SBUO29w7rOlxV31S2xda0m1KiCjPMQQm1uEu4=";
  };

  plugin-weewx-mqtt = pkgs.fetchurl {
    url = "https://github.com/matthewwall/weewx-mqtt/archive/d1739f3d57f07f402ddd3c20ac10ad5f874be1e9.zip";
    hash = "sha256-mNfZlrJPCo/vD5Dgt8PYa6ZHN+rTqqIA6c7MozY9Vss=";
  };

  plugin-weewx-mqtt-subscribe = pkgs.fetchurl {
    url = "https://github.com/bellrichm/weewx-mqttsubscribe/archive/refs/tags/v3.0.0.zip";
    hash = "sha256-izhEsOeRlg6wvwKnZnmHW+a/Y2eD1fsXwoBujoVaXAw=";
  };

  plugin-weewx-xaggs = pkgs.fetchurl {
    url = "https://github.com/tkeffer/weewx-xaggs/archive/5d11e149f96a98fe0518b9feb4ddc8a0d461db63.zip";
    hash = "sha256-lHg+/3l60wqV0r+9BHMtzuDQsrVJFP/Ql2XAHjp0UM4=";
  };

  plugin-weewx-gts = pkgs.fetchurl {
    url = "https://github.com/roe-dl/weewx-GTS/archive/7a92c51572ec461a174b61ffbc665036e3cfcf61.zip";
    hash = "sha256-/SDCmP785JOwI+/8AHJ9jhXmOarYWetb2Ruhm1f4b8Q=";
  };

  plugin-weewx-purpleair = pkgs.fetchurl {
    url = "https://github.com/bakerkj/weewx-purpleair/archive/refs/tags/v0.9.zip";
    hash = "sha256-L7mzbsb/Ewzd6kCrceOESMzEJDLjshFohgVK2U5/ZsM=";
  };

  plugin-weewx-wdc = pkgs.fetchurl {
    url = "https://github.com/Daveiano/weewx-wdc/releases/download/v3.5.1/weewx-wdc-v3.5.1.zip";
    hash = "sha256-MPjh/a6+f668yfD5AyCWFmyD1Q5p8nxCzESOUKx7wkQ=";
  };

  custom-extensions = # python
    ''
      #
      #    Copyright (c) 2009-2015 Tom Keffer <tkeffer@gmail.com>
      #
      #    See the file LICENSE.txt for your full rights.
      #

      """User extensions module

      This module is imported from the main executable, so anything put here will be
      executed before anything else happens. This makes it a good place to put user
      extensions.
      """

      import locale
      # This will use the locale specified by the environment variable 'LANG'
      # Other options are possible. See:
      # http://docs.python.org/2/library/locale.html#locale.setlocale
      locale.setlocale(locale.LC_ALL, ''')

      import weewx.units

      weewx.units.obs_group_dict['soilMoist1'] = 'group_percent'
      weewx.units.obs_group_dict['luminosity'] = 'group_illuminance'

      weewx.units.obs_group_dict['soilMoistBatteryVoltage1'] = 'group_volt'
      weewx.units.obs_group_dict['soilTempBatteryVoltage1'] = 'group_volt'

      weewx.units.obs_group_dict['solarEnergyDay'] = 'group_energy'
      weewx.units.obs_group_dict['solarEnergyActive'] = 'group_power'
      weewx.units.obs_group_dict['homeEnergyDay'] = 'group_energy'
      weewx.units.obs_group_dict['homeEnergyExportDay'] = 'group_energy'
      weewx.units.obs_group_dict['homeEnergyActive'] = 'group_power'
    '';
in
poetry2nix.mkPoetryApplication {
  inherit python;
  projectDir = weewx;

  overrides = poetry2nix.defaultPoetryOverrides.extend (
    final: prev: {
      ct3 = prev.ct3.overridePythonAttrs (old: {
        buildInputs = (old.buildInputs or [ ]) ++ [ prev.setuptools ];
      });

      pillow = prev.pillow.overridePythonAttrs (old: {
        postPatch = ''
          echo "# AVIF_ROOT = None" >> setup.py
        '';
      });

      pyserial = prev.pyserial.overridePythonAttrs (old: {
        buildInputs = (old.buildInputs or [ ]) ++ [ prev.setuptools ];
      });
    }
  );

  nativeBuildInputs = [
    # Poetry (?)
    cachecontrol
    cleo
    crashtest
    dulwich
    fastjsonschema
    keyring
    pexpect
    pkginfo
    platformdirs
    poetry-core
    requests-toolbelt
    shellingham
    tomlkit
    trove-classifiers
    virtualenv
    xattr

    pkgs.poetry
    pkgs.poetryPlugins.poetry-plugin-export
    pkgs.unzip
  ];

  propagatedBuildInputs = [
    paho-mqtt
    requests
  ];

  postPatch = ''
    substituteInPlace pyproject.toml --replace-fail 'requires = ["poetry>=0.12"]' "requires = []"
    substituteInPlace pyproject.toml --replace-fail "poetry.masonry" "poetry.core.masonry"
  '';

  postInstall = ''
    mkdir -p $out/home/weewx-data
    cp $out/lib/*/site-packages/weewx_data/weewx.conf $out/home/weewx-data/

    mkdir $TMPDIR/weewx-wdc/
    unzip ${plugin-weewx-wdc} -d $TMPDIR/weewx-wdc/

    HOME=$out/home $out/bin/weectl extension install ${plugin-weewx-mqtt} --yes
    HOME=$out/home $out/bin/weectl extension install ${plugin-weewx-mqtt-subscribe} --yes
    HOME=$out/home $out/bin/weectl extension install ${plugin-weewx-xaggs} --yes
    HOME=$out/home $out/bin/weectl extension install ${plugin-weewx-gts} --yes
    HOME=$out/home $out/bin/weectl extension install ${plugin-weewx-purpleair} --yes
    HOME=$out/home $out/bin/weectl extension install $TMPDIR/weewx-wdc/ --yes

    cat << EOF > $out/home/weewx-data/bin/user/extensions.py
    ${custom-extensions}
    EOF
  '';
}
