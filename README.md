# Shibaura-Railwayclub-Open-Panel-System
## 概要
OpenGLを用いた自作運転台向け運転台パネル表示システム
詳細な記法はサンプルを参照
## 構成
```json```ファイルにてファイル名やプロパティを指定
 
```GLSL```を用いて各オブジェクトで処理を行う
## 使用方法
```srops.dll```と同じディレクトリに```setup.json```を配置すると動く。記載する内容はサンプル参照

[DeailManager](https://github.com/mikangogo/DetailManager)を用いて、ほかのATSプラグインと合わせて使用すること推奨。```deailmodules.txt```の最上部にDLLを記載すること推奨

*注意 :*
*暴走している状態で閉じるとBVEがクラッシュする可能性があります*

# リファレンス
## setup.json
## window

| キー                | 型        | 例                  | 説明                                   |
|---------------------|-----------|---------------------|----------------------------------------|
| height              | 数値      | 480                 | ウインドウの高さ（ピクセル）           |
| width               | 数値      | 640                 | ウインドウの幅（ピクセル）             |
| title               | 文字列    | "Panel"             | ウインドウのタイトル                   |
| monitor             | null/数値 | null                | モニター番号（nullでデフォルト）       |
| background          | 配列      | [1.0, 0.0, 0.0, 0.0]| 背景色（RGBA形式） Aは0.0のとき不透明、1.0のときとき完全に透明                   |
| hint                | オブジェクト | { ... }             | OpenGLのバージョンやプロファイル設定   |

### hint

| キー                | 型        | 例      | 説明                       |
|---------------------|-----------|---------|----------------------------|
| GLver_major         | 数値      | 4       | OpenGLメジャーバージョン   |
| GLver_minor         | 数値      | 5       | OpenGLマイナーバージョン   |
| use_forward-compat  | 真偽値    | true    | OpenGLの```ForwardCompatProfileを使用するかしないか     |
| use_core-profile    | 真偽値    | true    | ```CoreProfile```使用するかしかしないか、使用しない場合```CompatiableProfile```を使用する           |

---

## panel

| キー        | 型    | 例        | 説明               |
|-------------|-------|-----------|--------------------|
| base-size   | 配列  | [64, 64]  | 画像の基本サイズ```scale```変数には画像サイズをこの値で割った値が入る |

---

## assets

| キー      | 型    | 例   | 説明                     |
|-----------|-------|------|--------------------------|
| texture   | 配列  | []   | テクスチャファイルのリスト|
| shader    | 配列  | []   | シェーダーファイルのリスト|
| object    | 配列  | []   | オブジェクトファイルのリスト|
| label     | 配列  | []   | ラベル定義のリスト       |
### texture

| キー    | 型      | 例                      | 説明                   |
|--------|---------|-------------------------|------------------------|
| key    | 文字列  | "speedMeter0"           | テクスチャの識別名     |
| src    | 文字列  | "picture.png"  | 画像ファイル名         |
| wrap   | 文字列  | "edge" / "repeat" / "border" / "mirrored-repeat"       | ラップモード           |
| filter | 文字列  | "nearest" / "linear"              | フィルタリングモード   |

---

### shader

| キー      | 型      | 例                | 説明                       |
|----------|---------|-------------------|----------------------------|
| key      | 文字列  | "speedMeterNeedle"| シェーダーの識別名         |
| vertex   | 文字列  | "shader.vert"   | バーテックスシェーダーファイル名    |
| fragment | 文字列  | "shader.frag"   | フラグメントシェーダーファイル名 |

---

### object

| キー        | 型      | 例                | 説明                       |
|------------|---------|-------------------|----------------------------|
| shader     | 文字列  | "speedMeterNeedle"          | 使用するシェーダー名       |
| texture    | 文字列  | "speedMeter0"    | 使用するテクスチャ名```null```を指定するとテクスチャを使用しない       |
| rect-type  | 文字列  | "center" / "right-top" / "right-bottom" / "left-top" / "left-bottom"         | 矩形の基準位置             |
| geometory  | 配列    | [0.0, 0.0]        | 形状情報                   |
| position   | 配列    | [0.0, 0.0]        | 配置座標                   |
| rect-scale   | 配列    | [0.0, 0.0]        | オブジェクトのスケール、記載がなければ```basic-size```プロパティで割った値になる                   |

---

### label

| キー        | 型      | 例                | 説明                       |
|------------|---------|-------------------|----------------------------|
| shader     | 文字列  | "label"           | 使用するシェーダー名       |
| texture    | 文字列  | "label"           | 使用するテクスチャ名       |
| rect-scale | 配列    | [0.70, 1.0]       | ラベルのスケール           |
| digits     | 数値    | 5                 | 表示桁数                   |
| position   | 配列    | [-11.0, 0.0]      | 配置座標                   |
## Uniform変数一覧
| 型           | 変数名             | Uniform番号 | 説明                                                        |
|:------------:|:------------------|:-----------:|:------------------------------------------------------------|
| sampler2D    | tex               | 0           | テクスチャユニットを指定する。テクスチャを使用する場合必ず0が指定される |
| vec2         | windowSize        | 1           | ウインドウのサイズ                                          |
| float        | windowScale       | 2           | ウインドウのスケール。必ず 100.0                            |
| vec2         | ObjectScale       | 3           | オブジェクトのスケール                                      |
| vec2         | ObjectGeometry    | 4           | オブジェクトの形状（サイズ）                                |
| vec2         | ObjectPosition    | 5           | オブジェクトの位置                                          |
| int          | emgBrake          | 6           | 非常ブレーキ                                                |
| int          | svcBrake          | 7           | サービスブレーキ                                            |
| int          | brakeNotch        | 8           | ブレーキノッチ                                              |
| int          | powerNotch        | 9           | パワーノッチ                                                |
| int          | reverser          | 10          | レバーサ                                                   |
| bool         | pilotlamp         | 11          | パイロットランプ                                            |
| double       | trainLocation     | 12          | 電車の現在位置                                              |
| float        | speed             | 13          | 速度                                                        |
| float        | trainBCpress      | 14          | ブレーキシリンダ圧力                                        |
| float        | trainMRpress      | 15          | 主空気溜圧力                                                |
| float        | trainERpress      | 16          | 制御弁圧力                                                  |
| float        | trainBPpress      | 17          | ブレーキ管圧力                                              |
| float        | trainSAPpress     | 18          | SAP圧力                                                     |
| float        | trainCurrent      | 19          | 電流                                                        |
| float        | bveTime           | 20          | BVEの経過時間                                               |
| float        | bveFrameTime      | 21          | BVEのフレーム毎の経過時間                                   |
| int          | labelDigitsPos    | 22          | ラベルの桁位置                                              |
## 困ったときは
### (0) : error C3001: no program defined
何らかの理由でシェーダーがコンパイルできないと考えられる。シェーダーの最後の行が改行しているとなぜかうまくいかないので末尾を確認しよう
### ウインドウが生成されない
何らかの理由で初期化時にエラーが発生したと思われる```srops.log```を確認しよう
### 起動したとたん落ちる
```setup.json```のシェーダーまたはテクスチャのいずれかの```src```に存在しないファイル名を入力するとクラッシュして落ちる。タイプミスがないか、パスが正しく指定されているかをしっかりと確認しよう
