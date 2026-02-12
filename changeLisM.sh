#!/bin/bash
set -e

WORK_DIR="$HOME/myLisM/zmk-config-LisM"
IMAGE_NAME="lism"
WIN_USER_NAME="kadok"
WIN_DOWNLOADS="/mnt/c/Users/$WIN_USER_NAME/Downloads/"

cd "$WORK_DIR"

echo "=== ファームウェアビルド ==="
docker run --rm \
    -v "$WORK_DIR:/workspaces/zmk-config" \
    -w /workspaces/zmk-config \
    "$IMAGE_NAME" \
    bash -c "rm -rf _west && make setup-west && make"

echo "=== 完了 ==="
cp -r "$WORK_DIR/firmware_builds/" "$WIN_DOWNLOADS"