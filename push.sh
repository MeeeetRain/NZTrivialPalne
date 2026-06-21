#!/bin/bash
# 一键推送脚本 — 双击或 ./push.sh 即可
# 自动处理：清锁、stage、commit、push

set -e
cd "$(dirname "$0")"

# 清掉沙盒可能留下的锁
rm -f .git/index.lock

# 看看有什么改动
if [ -z "$(git status --porcelain)" ]; then
  echo "✓ 没有需要提交的改动"
  exit 0
fi

echo "📝 改动的文件："
git status --short
echo ""

# 默认 commit message，可在命令行覆盖：./push.sh "你的 commit 消息"
MSG="${1:-update: $(date '+%Y-%m-%d %H:%M')}"

git add .
git commit -m "$MSG"
git push origin main

echo ""
echo "✅ 已推送到 GitHub，Cloudflare Pages 1-2 分钟自动部署"
echo "   公开版: https://nztrivialpalne.pages.dev/"
echo "   私密版: https://nztrivialpalne.pages.dev/private/"
