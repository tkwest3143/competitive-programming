# 競技プログラミング環境

複数言語対応の競技プログラミング用環境です。VSCodeとMakefileに対応しています。

## クイックスタート

### Makefileを使う場合
```bash
make init-ts  # TypeScript環境を初期化
make run-ts   # TypeScriptでmain.tsを実行
make help     # 使用可能なコマンドを表示
```

### VSCodeを使う場合
1. `F5`キー: TypeScriptプログラムを実行
2. `Cmd+Shift+P` → "Tasks: Run Task" → 実行したいタスクを選択
3. デバッグパネルから実行構成を選択

## 対応言語

### TypeScript
```bash
# Makefileを使う
make init-ts  # 環境初期化
make run-ts   # 実行

# または直接実行
cd typescript
npm run init  # 環境初期化
npm run run main  # 実行
```

詳細は[typescript/README.md](typescript/README.md)を参照してください。

## ディレクトリ構成

```
competitive-programming/
├── .vscode/        # VSCode設定
│   ├── launch.json # デバッグ構成
│   └── tasks.json  # タスク定義
├── typescript/     # TypeScript環境
│   ├── src/
│   ├── Makefile
│   ├── package.json
│   ├── tsconfig.json
│   └── README.md
├── python/         # Python環境（今後追加予定）
├── cpp/           # C++環境（今後追加予定）
├── Makefile       # ルートMakefile
└── README.md      # このファイル
```

## 使い方

1. 使用したい言語のディレクトリに移動
2. その言語のREADMEに従って環境をセットアップ
3. 問題を解く

## 共通機能

各言語環境では以下の機能を提供：
- テンプレートファイル
- 入力ファイルの管理
- 簡単な実行コマンド
- gitignoreによる作業ファイルの除外