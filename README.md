# zk-skills

ZK's personal skills for Claude Code, packaged as a plugin.

| Skill | Use |
|---|---|
| `agent-brief` | Write a brief for an executor that does not share your context. |
| `converge` | Cut documents, rules or scope back to what the current phase needs. |
| `doc-writing` | Write, rewrite or review documents that people and agents act on. |
| `root-solution` | Trace bad states to the choice that causes them and redesign from there. Manual only. |
| `fable-advisor` | Send a high-stakes question to an independent Fable subagent (`agents/fable-advisor.md`). Manual only. |
| `grilling` | Interview the user about a plan until nothing is assumed. Copied from [mattpocock/skills](https://github.com/mattpocock/skills), MIT; see `skills/grilling/LICENSE`. |

Install:

```
claude plugin marketplace add zk-hypersolid/zk-skills
claude plugin install zk-skills@zk-skills
```

`CLAUDE.md` is the author's global CLAUDE.md, which some skills refer to. Locally `~/.claude/CLAUDE.md` links to it. In Claude Code cloud sessions (`CLAUDE_CODE_REMOTE=true`), the plugin's SessionStart hook loads it from `main`; elsewhere the hook does nothing.

## License

MIT, see `LICENSE`. `skills/grilling` is copied from mattpocock/skills and keeps its own MIT license in `skills/grilling/LICENSE`.
