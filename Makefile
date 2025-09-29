# 競技プログラミング環境 - ルートMakefile

.PHONY: help init-ts run-ts test-ts init-py run-py init-cpp run-cpp

# デフォルトターゲット
help:
	@echo "競技プログラミング環境"
	@echo ""
	@echo "=== TypeScript ==="
	@echo "  make init-ts  - TypeScript環境を初期化"
	@echo "  make run-ts   - TypeScriptでmain.tsを実行"
	@echo "  make test-ts  - TypeScriptで全テストを実行"
	@echo ""
	@echo "=== Python (今後実装予定) ==="
	@echo "  make init-py  - Python環境を初期化"
	@echo "  make run-py   - Pythonでmain.pyを実行"
	@echo ""
	@echo "=== C++ (今後実装予定) ==="
	@echo "  make init-cpp - C++環境を初期化"
	@echo "  make run-cpp  - C++でmain.cppを実行"
	@echo ""
	@echo "各言語のディレクトリで make help を実行すると詳細なコマンドを確認できます"

# TypeScript関連
init-ts:
	@cd typescript && make init

run-ts:
	@cd typescript && make run

test-ts:
	@cd typescript && make test

# ショートカット（よく使うコマンド）
ts: run-ts
init: init-ts
run: run-ts

# Python関連（今後実装予定）
init-py:
	@echo "Python環境は準備中です"

run-py:
	@echo "Python環境は準備中です"

# C++関連（今後実装予定）
init-cpp:
	@echo "C++環境は準備中です"

run-cpp:
	@echo "C++環境は準備中です"