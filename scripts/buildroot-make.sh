#!/bin/bash
set -e

PATCH_DIR="$(dirname "$0")/../patches/buildroot"
BUILDROOT_DIR="$(dirname "$0")/../buildroot"
BUILDROOT_EXTERNAL_DIR="$(realpath "$(dirname "$0")/../app/buildroot")"

# Apply all patches if not already applied
for patch in "$PATCH_DIR"/*.patch; do
    if patch --dry-run -d "$BUILDROOT_DIR" -p1 < "$patch" > /dev/null 2>&1; then
        echo "Applying patch: $(basename "$patch")"
        patch -d "$BUILDROOT_DIR" -p1 < "$patch"
    else
        echo "Skipping already applied patch: $(basename "$patch")"
    fi
done

# Call buildroot make with passed arguments
make BR2_EXTERNAL="$BUILDROOT_EXTERNAL_DIR" -C "$BUILDROOT_DIR" "$@"

cd $BUILDROOT_DIR && git checkout . && git clean -f -d
