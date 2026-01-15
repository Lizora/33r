#!/bin/bash
# 共通デプロイスクリプト
# 使用方法: ./deploy.sh プロジェクト名 [コミットメッセージ]

set -e

if [ -z "$1" ]; then
  echo "使い方: ./deploy.sh プロジェクト名 [メッセージ]"
  exit 1
fi

PROJECT=$1
MSG=${2:-update}

cd "/Users/uutan/projects/$PROJECT" || { echo "プロジェクト $PROJECT が見つかりません"; exit 1; }

echo "🔧 [$PROJECT] に移動中..."
git add .
git commit -m "$MSG" || echo "⚠️ 変更がありません"
git push
echo "🚀 [$PROJECT] デプロイ完了"
