#!/bin/bash

echo "競技プログラミング環境を初期化中..."
echo ""

# 依存関係をインストール
if [ ! -d "node_modules" ]; then
    echo "依存関係をインストール中..."
    npm install
    echo "✓ 依存関係をインストールしました"
else
    echo "  依存関係は既にインストール済みです"
fi

# main.tsをtemplate.tsからコピー（常に上書き）
if [ -f "src/template.ts" ]; then
    cp src/template.ts src/main.ts
    echo "✓ src/main.ts をリセットしました"
else
    echo "エラー: src/template.ts が見つかりません"
    exit 1
fi

# 既存の入力ファイルをバックアップ（input.txtに内容があれば）
if [ -f "input.txt" ] && [ -s "input.txt" ]; then
    # タイムスタンプを付けてバックアップ
    timestamp=$(date +"%Y%m%d_%H%M%S")
    cp input.txt "input_backup_${timestamp}.txt"
    echo "  既存の input.txt を input_backup_${timestamp}.txt にバックアップしました"
fi

# input.txtを空ファイルとして作成（リセット）
> input.txt
echo "✓ input.txt をクリアしました"

# 複数の入力ファイルもクリア（もし存在すれば）
for i in 1 2 3 4 5; do
    if [ -f "input${i}.txt" ]; then
        > "input${i}.txt"
        echo "  input${i}.txt をクリアしました"
    fi
done

echo ""
echo "初期化完了！"
echo ""
echo "使い方:"
echo "  1. input.txt に問題の入力を貼り付け"
echo "  2. src/main.ts に解法を実装"
echo "  3. npm run run main で実行"