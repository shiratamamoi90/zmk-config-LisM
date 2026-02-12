#!/bin/bash
set -e

# 設定
REPO_URL="https://github.com/shiratamamoi90/zmk-config-LisM.git"
WORK_DIR="$HOME/myLisM/zmk-config-LisM"
IMAGE_NAME="lism"
WIN_USER_NAME="kadok"
WIN_DOWNLOADS="/mnt/c/Users/$WIN_USER_NAME/Downloads/"

echo "=== 1. リポジトリをクローン ==="
if [ -d "$WORK_DIR" ]; then
    echo "既存のフォルダがあります。更新します..."
    cd "$WORK_DIR"
    git pull
else
    git clone "$REPO_URL" "$WORK_DIR"
    cd "$WORK_DIR"
fi

echo "=== 2. Dockerイメージをビルド ==="
docker build -t "$IMAGE_NAME" .devcontainer/

echo "=== 3. セットアップ & ファームウェアビルド ==="
docker run --rm \
    -v "$WORK_DIR:/workspaces/zmk-config" \
    -w /workspaces/zmk-config \
    "$IMAGE_NAME" \
    bash -c "rm -rf _west && make setup-west && make"

echo "=== 完了 ==="
echo "ファームウェア: $WORK_DIR/firmware_builds/"
ls -la "$WORK_DIR/firmware_builds/"

cp -r "$WORK_DIR/firmware_builds/" "$WIN_DOWNLOADS"