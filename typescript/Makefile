# TypeScript競技プログラミング用Makefile

.PHONY: help init run run1 run2 run3 build clean test watch

# デフォルトターゲット
help:
	@echo "TypeScript競技プログラミング環境"
	@echo ""
	@echo "使用可能なコマンド:"
	@echo "  make init    - 環境を初期化（main.tsとinput.txtをリセット）"
	@echo "  make run     - main.tsをinput.txtで実行"
	@echo "  make run1    - main.tsをinput1.txtで実行"
	@echo "  make run2    - main.tsをinput2.txtで実行"
	@echo "  make run3    - main.tsをinput3.txtで実行"
	@echo "  make build   - TypeScriptをコンパイル"
	@echo "  make clean   - ビルド成果物を削除"
	@echo "  make test    - テストを実行（複数の入力ファイル）"
	@echo "  make watch   - ファイル変更を監視して自動実行"

# 環境初期化
init:
	@npm run init

# メイン実行
run:
	@npm run run main

# 各入力ファイルで実行
run1:
	@npm run run main 1

run2:
	@npm run run main 2

run3:
	@npm run run main 3

# ビルド
build:
	@npm run build

# クリーンアップ
clean:
	@rm -rf dist/
	@rm -f *.js *.js.map
	@echo "ビルド成果物を削除しました"

# 複数の入力でテスト
test:
	@echo "=== Test with input.txt ==="
	@npm run run main
	@if [ -f "input1.txt" ]; then \
		echo "\n=== Test with input1.txt ==="; \
		npm run run main 1; \
	fi
	@if [ -f "input2.txt" ]; then \
		echo "\n=== Test with input2.txt ==="; \
		npm run run main 2; \
	fi
	@if [ -f "input3.txt" ]; then \
		echo "\n=== Test with input3.txt ==="; \
		npm run run main 3; \
	fi

# ファイル監視（開発用）
watch:
	@echo "ファイル変更を監視中... (Ctrl+C で終了)"
	@while true; do \
		fswatch -1 src/main.ts input.txt 2>/dev/null || inotifywait -q -e modify src/main.ts input.txt 2>/dev/null; \
		clear; \
		echo "=== 実行: $$(date '+%H:%M:%S') ==="; \
		npm run run main; \
		echo "\n変更を監視中..."; \
	done