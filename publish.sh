#!/bin/sh
# 羅針盤をGitHub Pagesへ公開する（夜の店じまい用）
cd "$(dirname "$0")"
SRC="/Users/okadaaki/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Vault/目標管理/羅針盤.html"
{
  printf '<!doctype html>\n<html lang="ja">\n<meta charset="utf-8">\n<meta name="robots" content="noindex, nofollow">\n'
  cat "$SRC"
  printf '\n</html>\n'
} > index.html
git add -A
git commit -q -m "店じまい $(date +%F_%H:%M)" || echo "変更なし（前回から同じ内容）"
git push -q origin main && echo "公開しました"
