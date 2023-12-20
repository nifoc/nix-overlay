#!/usr/bin/env nix-shell
#!nix-shell -i bash -p curlMinimal jq
#shellcheck shell=bash

# Based on: https://github.com/NixOS/nixpkgs/blob/91a00709aebb3602f172a0bf47ba1ef013e34835/pkgs/development/tools/tabnine/update.sh

set -euo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

function prefetch-sri() {
    nix-prefetch-url "$1" 2>/dev/null |
        xargs nix --experimental-features nix-command hash to-sri --type sha256
}

declare -A platforms=(
    [x86_64-unknown-linux-musl]="x86_64-linux"
    [x86_64-apple-darwin]="x86_64-darwin"
    [aarch64-apple-darwin]="aarch64-darwin"
)

old_version="$(jq -r '.version' "$SCRIPT_DIR/sources.json")"
new_version="$(curl -sS https://update.tabnine.com/bundles/version)"

echo "Updating $old_version -> $new_version"

sources_tmp="$(mktemp)"
trap 'rm -f "$sources_tmp"' EXIT

cat <<EOF >"$sources_tmp"
{
  "version": "$new_version",
  "platforms": {}
}
EOF

for platform in "${!platforms[@]}"; do
    url="https://update.tabnine.com/bundles/${new_version}/${platform}/TabNine.zip"
    hash="$(prefetch-sri "$url")"
    nix_platform="${platforms[$platform]}"
    cat <<<"$(jq --arg nix_platform "$nix_platform" --arg platform "$platform" --arg hash "$hash" '.platforms += {($nix_platform): {name: $platform, hash: $hash}}' "$sources_tmp")" >"$sources_tmp"
done

cp "$sources_tmp" "$SCRIPT_DIR/sources.json"
