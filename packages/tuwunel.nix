# Copied from: https://github.com/NixOS/nixpkgs/blob/2631b0b7abcea6e640ce31cd78ea58910d31e650/pkgs/by-name/co/conduwuit/package.nix

{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  bzip2,
  zstd,
  stdenv,
  rocksdb,
  # upstream tuwunel enables jemalloc by default, so we follow suit
  enableJemalloc ? true,
  rust-jemalloc-sys,
  enableLiburing ? stdenv.hostPlatform.isLinux,
  liburing,
}:
let
  rust-jemalloc-sys' = rust-jemalloc-sys.override {
    unprefixed = !stdenv.hostPlatform.isDarwin;
  };
  rocksdb' = rocksdb.override {
    inherit enableLiburing;
    # rocksdb does not support prefixed jemalloc, which is required on darwin
    enableJemalloc = enableJemalloc && !stdenv.hostPlatform.isDarwin;
    jemalloc = rust-jemalloc-sys';
  };
in
rustPlatform.buildRustPackage rec {
  pname = "tuwunel";
  version = "0-unstable-2025-04-17";

  src = fetchFromGitHub {
    owner = "matrix-construct";
    repo = pname;
    rev = "eb2949d6d77349bc96932b1db3abf54e4fb07cc9";
    hash = "sha256-AoQff9D0ahy9K7Wyr6YOe+zNLli5pSc31xi6Mqv7XSM=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-RiP+Y651WOnLwLX2ajZV+GYh/xJsOVuz42wj8h4PoyQ=";

  nativeBuildInputs = [
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs =
    [
      bzip2
      zstd
    ]
    ++ lib.optional enableJemalloc rust-jemalloc-sys'
    ++ lib.optional enableLiburing liburing;

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
    ROCKSDB_INCLUDE_DIR = "${rocksdb'}/include";
    ROCKSDB_LIB_DIR = "${rocksdb'}/lib";
  };

  buildNoDefaultFeatures = true;
  # See https://github.com/matrix-construct/tuwunel/blob/main/src/main/Cargo.toml
  # for available features.
  # We enable all default features except jemalloc and io_uring, which
  # we guard behind our own (default-enabled) flags.
  buildFeatures =
    [
      "brotli_compression"
      "element_hacks"
      "gzip_compression"
      "release_max_log_level"
      "sentry_telemetry"
      "systemd"
      "zstd_compression"
    ]
    ++ lib.optional enableJemalloc "jemalloc"
    ++ lib.optional enableLiburing "io_uring";

  meta = {
    description = "Matrix homeserver written in Rust, successor to conduwuit";
    homepage = "https://github.com/matrix-construct/tuwunel";
    license = lib.licenses.asl20;
    mainProgram = "conduwuit";
  };
}
