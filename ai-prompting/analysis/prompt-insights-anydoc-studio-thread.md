---
id: prm.73150756
type: prompt
title: Prompt Insights — AnyDoc Studio Thread
tags: []
role: user
summary: Extracted from conversation analysis - Prompt Insights — AnyDoc Studio Thread
vars:
  - { name: user_goal, required: true, description: "Extracted from: - {USER_GOAL} (plain language)" }
  - { name: non_negotiables, required: true, description: "Extracted from: - {NON_NEGOTIABLES} (stack/libs/security)" }
  - { name: block_primitives, required: true, description: "Extracted from: - {BLOCK_PRIMITIVES} (types + schemas)" }
  - { name: persistence, required: true, description: "Extracted from: - {PERSISTENCE} (local/DB)" }
  - { name: exports, required: true, description: "Extracted from: - {EXPORTS} (md/pdf/json)" }
version: 1
source_insights: prompt-insights--73150756.md
---

# Prompt Insights — AnyDoc Studio Thread

**Extracted from conversation analysis on 2023-06-08.**

---

## 🎯 The Complete Prompt

```markdown
ROLE: You are a senior full‑stack engineer + prompt architect building {PRODUCT_NAME}.

OBJECTIVE: Create a doc‑agnostic web app where a chat assistant ({LLM_PROVIDER}) can create, render, and edit ANY document via natural language AND direct UI edits.

INPUTS:
- {USER_GOAL} (plain language)
- {NON_NEGOTIABLES} (stack/libs/security)
- {BLOCK_PRIMITIVES} (types + schemas)
- {PERSISTENCE} (local/DB)
- {EXPORTS} (md/pdf/json)
- {RESEARCH_REQUIRED} (yes/no)

PROCESS CHECKLIST:
1) **Clarify**: Restate scope; list assumptions; propose risks & mitigations.
2) **Architecture**: Define DocSpec (block graph), renderer registry, JSON Patch flow, tool schema for model.
3) **Plan**: Milestones (M1..Mn) with deliverables; test strategy (unit/e2e).
4) **Security**: Sanitization, CSP, no eval, validation hooks.
5) **Research (if {RESEARCH_REQUIRED}=yes)**: Compare 2–3 prior arts (editors/patch libs); cite links; capture do’s/don’ts.
6) **Deliverables**: Output a single copy‑ready build prompt + file tree.

OUTPUT SPEC:
- Sections: Overview, Stack, DocSpec schema, Tool contracts, Patch rules, Renderer rules, API routes, Implementation Plan, Tests, Security, Export, Optional extensions.
- Include code stubs (TypeScript types for Doc/Block/Patch).
- Provide a concise “How to Run” and env keys.
- **All external claims include source links.**

QUALITY CHECKS:
- Lint: Constraints satisfied? DocSpec covers requested blocks?
- Tests: At least 2 reducers + 2 e2e flows described.
- Safety: No `eval`; sanitize HTML; Zod/Ajv validation on mutations.
- Traceability: Each requirement → plan step or tool contract.
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ **Doc-agnostic architectures** (block graph + patches) prevent dead-ends when new doc types appear.
- ✅ **Single consolidated prompts** reduce ambiguity and speed execution.
- ✅ **JSON Patch + Pointer** is a safe lingua franca for LLM + UI edits.
- ✅ **Research requests must trigger actual web verification** with citations.
- ✅ **Naming/branding decisions benefit from quick lists and fast selection, but should be vetted.**

---

## 🔧 Prompt Structure

**Role:** You are a senior full‑stack engineer + prompt architect building {PRODUCT_NAME}.

**Task:** Create a doc‑agnostic web app where a chat assistant ({LLM_PROVIDER}) can create, render, and edit ANY document via natural language AND direct UI edits.

**Inputs:**
- {USER_GOAL} (plain language)
- {NON_NEGOTIABLES} (stack/libs/security)
- {BLOCK_PRIMITIVES} (types + schemas)
- {PERSISTENCE} (local/DB)
- {EXPORTS} (md/pdf/json)
- {RESEARCH_REQUIRED} (yes/no)

**Process:**
1) **Clarify**: Restate scope; list assumptions; propose risks & mitigations.
2) **Architecture**: Define DocSpec (block graph), renderer registry, JSON Patch flow, tool schema for model.
3) **Plan**: Milestones (M1..Mn) with deliverables; test strategy (unit/e2e).
4) **Security**: Sanitization, CSP, no eval, validation hooks.
5) **Research (if {RESEARCH_REQUIRED}=yes)**: Compare 2–3 prior arts (editors/patch libs); cite links; capture do’s/don’ts.
6) **Deliverables**: Output a single copy‑ready build prompt + file tree.

**Quality Checks:**
- Lint: Constraints satisfied? DocSpec covers requested blocks?
- Tests: At least 2 reducers + 2 e2e flows described.
- Safety: No `eval`; sanitize HTML; Zod/Ajv validation on mutations.
- Traceability: Each requirement → plan step or tool contract.

---

## 🔗 Related Arsenal Items

### 📝 Related Prompts
- **[Prompt Forensics Analyzer](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/meta-prompting/prompt-forensics-analyzer.md)** - Complementary prompt pattern
- **[Insights Intake Processor](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/meta-prompting/insights-intake-processor.md)** - Complementary prompt pattern
- **[Opportunity Hunter](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/ai-prompting/analysis/prompt-forensics-chainminer-opportunity-hunter.md)** - Complementary prompt pattern
- **[Thread Audit Report](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/ai-prompting/analysis/prompt-forensics-report-prior-thread-audit.md)** - Complementary prompt pattern

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
