#!/usr/bin/env bash
# Claire ⚧ — trans-flag rebranded statusline
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(echo "$input" | jq -r '.model.display_name')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
lines_added=$(echo "$input" | jq -r '.cost.total_lines_added // 0')
lines_removed=$(echo "$input" | jq -r '.cost.total_lines_removed // 0')
rate_5h=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')

dir=$(basename "$cwd")
branch=$(git -C "$cwd" branch --show-current 2>/dev/null)

RST=$'\033[0m'
# Trans pride flag (24-bit truecolor)
BLU=$'\033[38;2;91;206;250m'   # #5BCEFA light blue
PNK=$'\033[38;2;245;169;184m'  # #F5A9B8 pink
WHT=$'\033[38;2;255;255;255m'  # white
GRN=$'\033[32m'
RED=$'\033[31m'

# "Claire" wordmark, lettered in the flag's symmetric stripe order
claire="${BLU}C${PNK}l${WHT}a${WHT}i${PNK}r${BLU}e${RST}"
mark="${PNK}⚧${RST}"

branch_part=""
if [ -n "$branch" ]; then
  branch_part=" ${WHT}${branch}${RST}"
fi

lines_part=""
if [ "$lines_added" != "0" ] || [ "$lines_removed" != "0" ]; then
  lines_part=" ${GRN}+${lines_added}${RST}${RED}-${lines_removed}${RST}"
fi

rate_part=""
if [ -n "$rate_5h" ]; then
  rate_part=" ${BLU}5h:$(printf '%.0f' "$rate_5h")%${RST}"
fi

ctx_part=""
if [ -n "$used" ]; then
  ctx_part=" ${PNK}ctx:$(printf '%.0f' "$used")%${RST}"
fi

printf "%s" "${mark} ${claire} ${BLU}${model}${RST} ${PNK}${dir}${RST}${branch_part}${lines_part}${ctx_part}${rate_part}"
