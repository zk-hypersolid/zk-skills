#!/bin/sh
# Cloud sessions only: load ZK's global CLAUDE.md from this repo's main branch.
# On a local machine ~/.claude/CLAUDE.md already holds it, so do nothing there.
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] || exit 0
url="https://raw.githubusercontent.com/zk-hypersolid/zk-skills/main/CLAUDE.md"
if body=$(curl -fsSL --max-time 8 "$url" 2>/dev/null) && [ -n "$body" ]; then
  src="zk-skills main (fetched at session start)"
else
  body=$(cat "${CLAUDE_PLUGIN_ROOT}/CLAUDE.md")
  src="zk-skills plugin copy (main was unreachable)"
fi
printf '以下是 ZK 的全局工作约定，等同于用户级 CLAUDE.md。来源：%s。\n\n%s\n' "$src" "$body"
