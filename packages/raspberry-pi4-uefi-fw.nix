{
  stdenvNoCC,
  fetchzip,
  fetchFromGitHub,
  python3Packages,
}:
let
  # Keep these somewhat in sync, even though the dtbo hasn't changed in forever
  version = "1.50";
  firmwareVersion = "15d63ac546e91ec5e31fb9a620c07328d000eb88";

  firmware = fetchFromGitHub {
    owner = "raspberrypi";
    repo = "firmware";
    rev = firmwareVersion;
    hash = "sha256-NCW3t4KFNqApDt+3b7xKPa2ZmyJ8/i+e8K7h4JpH0mA=";
  };
in
stdenvNoCC.mkDerivation {
  pname = "rpi4-uefi-firmware-images";
  inherit version;

  src = fetchzip {
    url = "https://github.com/pftf/RPi4/releases/download/v${version}/RPi4_UEFI_Firmware_v${version}.zip";
    hash = "sha256-g8046/Ox0hZgvU6u3ZfC6HMqoTME0Y7NsZD6NvUsp7w=";
    stripRoot = false;
  };

  nativeBuildInputs = [
    python3Packages.virt-firmware
  ];

  dontFixUp = true;

  installPhase = ''
    runHook preInstall
    mkdir $out
    rm Readme.md

    # Remove the RAM limitation to allow the usage of the full 8 GB
    virt-fw-vars \
        --input RPI_EFI.fd \
        --output RPI_EFI.fd \
        --set-json <(cat <<EOF
    {
        "version": 2,
        "variables": [
            {
                "name": "RamLimitTo3GB",
                "guid": "cd7cc258-31db-22e6-9f22-63b0b8eed6b5",
                "data": "00000000"
            }
        ]
    }
    EOF
    )

    # See: https://github.com/pftf/RPi4/pull/279
    cp ${firmware}/boot/overlays/pcie-32bit-dma.dtbo overlays/
    echo "dtoverlay=pcie-32bit-dma" >> config.txt

    cp -r ./. $out
    runHook postInstall
  '';
}
