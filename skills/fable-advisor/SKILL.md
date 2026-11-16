---
name: fable-advisor
description: 派 fable-advisor（固定 Fable）独立审一件事：方案、规则、技能、评审冲突。只在 ZK 用 /fable-advisor 调用时使用。
disable-model-invocation: true
---

# fable-advisor

ZK 用这个命令，就是明确要 Fable 独立审。

1. 派 `fable-advisor` subagent，不传 `model` 参数。项目记忆里「评审员用 Opus」的条目管的是多评审员并行扇出，不管这里。
2. brief 按 CLAUDE.md「委派」写：ZK 原话（含这次命令后面的话）、我的意图复述、已核实的事实、材料路径；不给我的结论。要审的对象不清楚时，按当前对话里最近在做的方案或改动理解，并在 brief 的意图复述里写明。
3. 后台跑。回来后核对它的事实性说法，再转告 ZK：结论、理由、建议改什么。ZK 已经授权改的，核对后直接落地。
