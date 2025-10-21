---
id: prm.72177e32
type: prompt
title: Prompt Insights – n8n Workflow Programmatic Thread (72177e32)
tags: []
role: user
summary: Extracted from conversation analysis - Prompt Insights – n8n Workflow Programmatic Thread (72177e32)
vars:
  - { name: context, required: false, description: "Extracted from: - {CONTEXT}: prior materials/specs (optional)" }
  - { name: target_stack, required: true, description: "Extracted from: - {TARGET_STACK}: e.g., n8n (version), Docker, OS" }
  - { name: runtime_env, required: true, description: "Extracted from: - {RUNTIME_ENV}: Jupyter/Notebook vs. plain Python" }
  - { name: output_type, required: true, description: "Extracted from: - {OUTPUT_TYPE}: report | notebook | both" }
  - { name: security, required: true, description: "Extracted from: - {SECURITY}: env var names; secret handling requi" }
version: 1
source_insights: prompt-insights--72177e32.md
---

# Prompt Insights – n8n Workflow Programmatic Thread (72177e32)

**Extracted from conversation analysis on 2023-05-14.**

---

## 🎯 The Complete Prompt

```markdown
ROLE: You are a senior automation engineer + technical writer.
OBJECTIVE: Produce a runnable artifact and minimal docs to {GOAL}.

INPUTS:
- {CONTEXT}: prior materials/specs (optional)
- {TARGET_STACK}: e.g., n8n (version), Docker, OS
- {RUNTIME_ENV}: Jupyter/Notebook vs. plain Python; network limits
- {OUTPUT_TYPE}: report | notebook | both
- {SECURITY}: env var names; secret handling requirements

PROCESS CHECKLIST:
1) Confirm assumptions (version, endpoints, auth) from {TARGET_STACK} and {RUNTIME_ENV}.
2) Generate the core artifact (code + minimal config) with inline comments.
3) Add verification steps (health check, dry run, sample output).
4) Provide cleanup, idempotency tips, and next-step extensibility.
5) Include a short troubleshooting section with common failure modes.
6) If {CONTEXT} exists, merge deltas as an addendum table.

OUTPUT SPEC:
- If report: sections = Overview, Schema/Model, Steps, Code Samples, Tests, Troubleshooting.
- If notebook: cells = deps install, config, launch, wait/health, create workflow, trigger, inspect output, cleanup.
- Provide copy-ready commands and avoid hard-coded secrets (use {SECURITY}).

QUALITY CHECKS:
- Validate all paths/ports; prefer `/healthz` readiness.
- No secrets in code; reference env vars.
- Execution should succeed offline except for Docker image pulls.

ANTI-FRAGILITY:
- If a tool is unavailable (e.g., Docker), fallback to documented alternative and flag it.
- Version-pin images and note Cloud vs self-hosted endpoint differences (`/api/v1` vs `/rest`).
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ Specific environment requests (“Jupyter + Docker + trigger”) yield executable deliverables.
- ✅ User-provided source material accelerates convergence when the assistant summarizes deltas, not duplicates.
- ✅ Explicit health checks and idempotent cleanup make notebooks production-friendly.
- ✅ Using node IDs (not names) in connections prevents fragile graphs.
- ✅ Version pinning and secret hygiene should be defaults, not afterthoughts.

---

## 🔧 Prompt Structure

**Role:** You are a senior automation engineer + technical writer.

**Task:** Produce a runnable artifact and minimal docs to {GOAL}.

**Inputs:**
- {CONTEXT}: prior materials/specs (optional)
- {TARGET_STACK}: e.g., n8n (version), Docker, OS
- {RUNTIME_ENV}: Jupyter/Notebook vs. plain Python; network limits
- {OUTPUT_TYPE}: report | notebook | both
- {SECURITY}: env var names; secret handling requirements

**Process:**
1) Confirm assumptions (version, endpoints, auth) from {TARGET_STACK} and {RUNTIME_ENV}.
2) Generate the core artifact (code + minimal config) with inline comments.
3) Add verification steps (health check, dry run, sample output).
4) Provide cleanup, idempotency tips, and next-step extensibility.
5) Include a short troubleshooting section with common failure modes.
6) If {CONTEXT} exists, merge deltas as an addendum table.

**Quality Checks:**
- Validate all paths/ports; prefer `/healthz` readiness.
- No secrets in code; reference env vars.
- Execution should succeed offline except for Docker image pulls.

---

## 🔗 Related Arsenal Items

### 📝 Related Prompts
- **[Zapier MCP Tools](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/automation/workflow/prompt-insights-zapier-mcp-tools-thread.md)** - Complementary prompt pattern
- **[N8N Workflow Builder](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/automation/workflow/prompt-insights-n8n-workflow-programmatic-thread.md)** - Complementary prompt pattern
- **[Structured Document Architect](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/development/documentation/structured-document-architect.md)** - Complementary prompt pattern

### 💭 Memories
- **[Prompt Patterns Library](https://github.com/ChrisTansey007/windsurf-memories-arsenal/blob/main/prompt-engineering/prompt-patterns-library.md)** - Pattern catalog and techniques

### ⚙️ Rules
- **[Prompt Quality Standards](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/prompt-design/prompt-quality-standards.md)** - 5-D framework for prompts

### 🔄 Workflows
- **[Meta-Prompting Workflow](https://github.com/ChrisTansey007/arsenal-integration-hub/blob/main/examples/meta-prompting/README.md)** - Complete prompt extraction pipeline

### 🛠️ Tools
- **[Arsenal CLI](https://github.com/ChrisTansey007/arsenal-cli)** - Search and manage prompts via command line
- **[Arsenal MCP Server](https://github.com/ChrisTansey007/arsenal-mcp-server)** - Access prompts via Model Context Protocol
---

## 📖 Source

**Extracted from:** {file_data['filename']}  
**Original conversation:** {file_data.get('date', 'Unknown')}  
**Domain:** {domain}  
**Quality score:** {file_data.get('quality_score', 'Unknown')}

---

**Result: Production-ready prompt from analyzed conversation!** 🚀
