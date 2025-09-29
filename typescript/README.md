# 競技プログラミング TypeScript環境

## セットアップ

```bash
# Makefileを使う場合
make init

# または npm を使う場合
npm run init
```

これにより以下が実行されます：
- 依存関係のインストール（`npm install`）
- `src/main.ts`をtemplate.tsからリセット
- `input.txt`をクリア（既存の内容はバックアップ）
- `input1.txt`～`input5.txt`もクリア（存在する場合）

## 使い方

### 1. 新しい問題を開始

```bash
npm run init  # 環境を初期化（main.tsとinput.txtをリセット）
```

注意: 既存の`input.txt`は自動的に`input_backup_YYYYMMDD_HHMMSS.txt`として保存されます。

```typescript
import * as fs from 'fs';

function main(input: string): void {
    const lines = input.trim().split('\n');
    // ここに解法を実装
}

if (require.main === module) {
    const input = fs.readFileSync('/dev/stdin', 'utf8');
    main(input);
}
```

### 2. 入力ファイルを準備

問題の入力を`input.txt`に保存します。

```
3 5
```

複数のテストケースがある場合は、`input1.txt`, `input2.txt`などを作成できます。

### 3. 実行

#### Makefileを使う場合
```bash
make run      # main.tsをinput.txtで実行
make run1     # main.tsをinput1.txtで実行
make run2     # main.tsをinput2.txtで実行
make test     # 全ての入力ファイルでテスト
make watch    # ファイル変更を監視して自動実行
make help     # 使用可能なコマンド一覧
```

#### VSCodeを使う場合
- **F5キー**: main.tsをデバッグ実行
- **Cmd+Shift+P** → "Tasks: Run Task": 各種タスクを実行
- **デバッグパネル**: 実行構成を選択して実行

#### npmを使う場合
```bash
npm run run main      # main.tsをinput.txtで実行
npm run run main 1    # main.tsをinput1.txtで実行
./run.sh src/main.ts  # 直接実行
```

## ファイル構成

```
.
├── src/
│   ├── main.ts      # 作業用ファイル（自動生成、gitignore対象）
│   └── template.ts  # 問題解答用テンプレート
├── input.txt        # デフォルト入力ファイル（自動生成、gitignore対象）
├── init.sh         # 初期化スクリプト
├── run.sh          # 実行スクリプト
├── package.json    # Node.js設定
└── tsconfig.json   # TypeScript設定
```

## よく使うコード片

### 数値の読み込み

```typescript
// 単一の数値
const n = parseInt(lines[0]);

// スペース区切りの数値
const [a, b] = lines[0].split(' ').map(x => parseInt(x));

// 配列として
const numbers = lines[1].split(' ').map(x => parseInt(x));
```

### 複数行の読み込み

```typescript
const n = parseInt(lines[0]);
for (let i = 1; i <= n; i++) {
    const [a, b] = lines[i].split(' ').map(x => parseInt(x));
    // 処理
}
```

### 2次元配列

```typescript
const [h, w] = lines[0].split(' ').map(x => parseInt(x));
const grid: string[][] = [];
for (let i = 0; i < h; i++) {
    grid.push(lines[i + 1].split(''));
}
```

## TypeScript設定

`tsconfig.json`でES2022を対象にしており、最新のJavaScript機能が使用できます：
- Array.prototype.at()
- String.prototype.replaceAll()
- その他のES2022機能

## トラブルシューティング

### 実行時エラーが出る場合

1. `input.txt`が存在するか確認
2. ファイル名が正しいか確認
3. `npm install`を実行したか確認

### TypeScriptのエラーが出る場合

厳格な型チェックが有効になっています。必要に応じて型注釈を追加してください。