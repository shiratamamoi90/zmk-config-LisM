# LisM キーボード ファームウェア

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

自作キーボード LisMのファームウェアです。

## 生成されるファームウェア一覧

| ファームウェア名                                 | 説明                                    |
|---------------------------------------------- |---------------------------------------|
| `lism_left_peripheral_non_trackball.uf2`      | 左側 ペリフェラル 非トラックボール     |
| `lism_left_peripheral_trackball.uf2`          | 左側 ペリフェラル トラックボール       |
| `lism_right_central_non_trackball.uf2`        | 右側 セントラル 非トラックボール       |
| `lism_right_central_trackball.uf2`            | 右側 セントラル トラックボール         |
| `lism_right_central_non_trackball_studio.uf2` | 右側 セントラル 非トラックボール (ZMK Studio 対応) |
| `lism_right_central_trackball_studio.uf2`     | 右側 セントラル トラックボール (ZMK Studio 対応)   |
| `settings_reset-seeeduino_xiao_ble-zmk.uf2`   | 設定リセット用                        |

## ビルド手順

### ローカル

※参照元 [https://github.com/4mplelab/zmk-config-LisM]

ローカル環境でのビルド手順

1. 準備
   1. git をインストール
   2. Docker をインストール

2. 任意のディレクトリにこのリポジトリをclone

3. cloneしたディレクトリに移動

4. config/west.yml の name: zmk-rgbled-widget > revision を「v0.3」に変更

5. ビルド
   1. **初回の場合、setupLisM.sh を起動**
      ```bash
      $zmk-config-LisM ./setupLisM.sh
      ```
   2. **２回目以降の場合、changeLisM.sh を起動**
      ```bash
      $zmk-config-LisM ./changeLisM.sh
      ```
6. ダウンロードフォルダに格納されている

### ファームウェアの書き込み

1. ケーブルで接続

2. ブートローダーモードで起動
   ・反対側のキーボードの外側1番下のキーを押しながら、ブートローダーモードにしたい側のキーボードの外側1番下キーを押す
   ・キーボード底面のリセットボタンを素早く2回押す
   ・キーボード底面のリセットボタンを素早く2回押す

   → USBドライブとして認識

3. 対象の .uf2 ファイルをドラッグアンドドロップする。
   ※エクスプローラーが閉じるが書き込み完了している。

### Keymap EditorでのGithubAction

リンク [https://nickcoutsos.github.io/keymap-editor/]

## セントラル／ペリフェラルの入れ替え

LisM は左右どちらでも「セントラル（Central）」と「ペリフェラル（Peripheral）」を選べます。  
既定は右セントラルですが、左セントラル構成も用意できます。
1. `build.yaml` の「Central = Left」ブロックを有効化。
1. `build.yaml` の「Central = Right」ブロックを無効化。
1. ビルドして書き込み

## リンク
- [ドキュメント](https://4mplelab.github.io/LisM/)
- [販売ページ](https://shop.4mple-lab.com/items/119269662)
