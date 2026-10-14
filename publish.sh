#!/bin/bash
# 기계연 덱 HTML(대본 포함)을 kimm-decks 레포 구조로 복사한다. 사용: bash publish.sh
set -euo pipefail
C=/Users/chulrolee/axwith-lecture/30-courses/kimm-equipment-ai-2026
R="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$R/morning/media" "$R/afternoon"
rsync -a --delete "$C/_decks/morning/assets/" "$R/morning/assets/"
rsync -a --delete "$C/media/jev-videos/" "$R/morning/media/jev-videos/"
rsync -a --delete "$C/_decks/afternoon/assets/" "$R/afternoon/assets/"
sed 's#\.\./\.\./media/#media/#g' "$C/_decks/morning/deck.html" > "$R/morning/index.html"
cp "$C/_decks/afternoon/deck.html" "$R/afternoon/index.html"
echo "copied"
