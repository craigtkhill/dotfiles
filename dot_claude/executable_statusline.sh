#!/bin/bash
in=$(cat)
j() { echo "$in" | jq -r "$1"; }
model=$(j '.model.display_name // "?"')
ctx=$(j 'if .context_window.used_percentage != null then "\(.context_window.used_percentage | floor)%" else "n/a" end')
h5=$(j 'if .rate_limits.five_hour.used_percentage != null then "\(.rate_limits.five_hour.used_percentage | floor)%" else "n/a" end')
d7=$(j 'if .rate_limits.seven_day.used_percentage != null then "\(.rate_limits.seven_day.used_percentage | floor)%" else empty end')
rs=$(j '.rate_limits.five_hour.resets_at // empty')
[ -n "$rs" ] && rs=$(date -r "$rs" +%H:%M 2>/dev/null)
dir=$(j '.workspace.current_dir // .cwd')
repo=$(j '.workspace.repo.name // empty')
[ -z "$repo" ] && repo=$(basename "$(git -C "$dir" rev-parse --show-toplevel 2>/dev/null)")
branch=$(git -C "$dir" branch --show-current 2>/dev/null)
out="$model | ctx $ctx | 5h $h5"
[ -n "$d7" ] && out="$out | 7d $d7"
[ -n "$rs" ] && out="$out | resets $rs"
[ -n "$repo" ] && out="$out | $repo"
[ -n "$branch" ] && out="$out | $branch"
echo "$out"
