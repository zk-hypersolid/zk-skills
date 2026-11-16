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

Some skills refer to the author's global CLAUDE.md, which is not in this repository.
