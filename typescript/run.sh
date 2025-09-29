#!/bin/bash

# 使い方: 
# npm run run sample    # src/sample.ts を input.txt で実行
# npm run run sample 1  # src/sample.ts を input1.txt で実行
# ./run.sh src/sample.ts  # 直接実行

FILE=$1
INPUT_NUM=${2:-""}

# ファイル名の処理
if [[ "$FILE" == *.ts ]]; then
    # フルパスが指定された場合
    if [ ! -f "$FILE" ]; then
        echo "エラー: ファイル '$FILE' が見つかりません"
        exit 1
    fi
else
    # ファイル名のみが指定された場合、src/ディレクトリから探す
    FILE="src/${FILE}.ts"
    if [ ! -f "$FILE" ]; then
        echo "エラー: ファイル '$FILE' が見つかりません"
        exit 1
    fi
fi

# 入力ファイルの決定
if [ -n "$INPUT_NUM" ]; then
    INPUT_FILE="input${INPUT_NUM}.txt"
else
    INPUT_FILE="input.txt"
fi

# 入力ファイルが存在する場合はそれを使用、なければ標準入力から
if [ -f "$INPUT_FILE" ]; then
    echo "実行: $FILE < $INPUT_FILE"
    echo "---出力---"
    npx ts-node "$FILE" < "$INPUT_FILE"
else
    echo "実行: $FILE (標準入力待ち)"
    echo "入力を入れて Ctrl+D で終了:"
    npx ts-node "$FILE"
fi