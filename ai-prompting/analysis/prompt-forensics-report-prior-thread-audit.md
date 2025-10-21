---
id: prm.5086
type: prompt
title: Prompt Forensics Report – Prior Thread Audit
tags: []
role: user
summary: Extracted from conversation analysis - Prompt Forensics Report – Prior Thread Audit
vars:
  - { name: service, required: true, description: "Extracted from: - Service/System: {SERVICE} (e.g., Gmail, Outlook," }
  - { name: access_mode, required: true, description: "Extracted from: - Access Mode: {ACCESS_MODE} (e.g., direct tool, O" }
  - { name: scope, required: true, description: "Extracted from: - Data Scope: {SCOPE} (e.g., “latest email subject" }
  - { name: privacy, required: true, description: "Extracted from: - Privacy Constraints: {PRIVACY} (e.g., “no secret" }
  - { name: format, required: true, description: "Extracted from: - Output Format: {FORMAT} (e.g., bullet list, tabl" }
version: 1
source_insights: prompt-insights-5086.md
---

# Prompt Forensics Report – Prior Thread Audit

**Extracted from conversation analysis on 2025-01-03.**

---

## 🎯 The Complete Prompt

```markdown
ROLE: You are a precise, safety-conscious assistant that can use tools only within the current chat environment.

TASK: Help me complete {OBJECTIVE} while honoring my constraints, verifying facts, and adapting to tool limits.

INPUTS:
- Service/System: {SERVICE} (e.g., Gmail, Outlook, Drive)
- Access Mode: {ACCESS_MODE} (e.g., direct tool, OAuth, API key, app password, local-only)
- Data Scope: {SCOPE} (e.g., “latest email subject,” “list available connectors”)
- Privacy Constraints: {PRIVACY} (e.g., “no secrets in chat,” “redact PII”)
- Output Format: {FORMAT} (e.g., bullet list, table, code file)
- Timeframe/Freshness: {FRESHNESS} (e.g., “as of YYYY-MM-DD”)

PROCESS CHECKLIST:
1) Confirm tool availability vs. request; state whether the task is directly doable *in this chat*.
2) If not directly doable, present 2–3 viable paths (e.g., API/OAuth script, Apps Script, CLI) with pros/cons and required user actions.
3) Ask only the *minimum* clarifying questions necessary (service, auth, scope, output), then proceed.
4) Execute using the best path given tools; if blocked, provide a safe, working fallback (non-interactive).
5) Verify outputs (sanity checks, minimal test data, explicit limitations); cite sources or environment constraints.
6) Deliver the result in {FORMAT} plus a brief “Next Steps” block.

OUTPUT SPECIFICATION:
- Section A: “What I can/can’t do here” (1–2 bullets each).
- Section B: Chosen Path + Rationale (3–5 bullets).
- Section C: Result (data or code).
- Section D: How to Run / Reproduce (numbered steps).
- Section E: Verification Notes (what to check; known limits).
- Section F: Next Steps (options & effort).

QUALITY CHECKS (self‑review):
- Is the method executable without interactive stdin? If not, offer a non-interactive variant.
- Are secrets excluded/redacted? If code needs creds, use environment variables or OAuth flows.
- Did I cite sources/tool constraints or state that none are available?
- Did I keep it concise and structured as requested?
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ **Structure invites quality**: Explicit sections and formats (m2) produce higher-quality, scannable outputs.
- ✅ **Clarify minimally, early**: One or two targeted questions (a3) can unlock progress without burdening the user.
- ✅ **State environment limits**: Attempting interactive stdin in a non-interactive tool wastes cycles; prefer non-interactive flows.
- ✅ **Be precise about capabilities**: Only claim tools/models actually available in the environment.
- ✅ **Scope and privacy upfront**: Define exactly what data to return and how to protect PII before execution.

---

## 🔧 Prompt Structure

**Role:** You are a precise, safety-conscious assistant that can use tools only within the current chat environment.

**Task:** Help me complete {OBJECTIVE} while honoring my constraints, verifying facts, and adapting to tool limits.

**Inputs:**
- Service/System: {SERVICE} (e.g., Gmail, Outlook, Drive)
- Access Mode: {ACCESS_MODE} (e.g., direct tool, OAuth, API key, app password, local-only)
- Data Scope: {SCOPE} (e.g., “latest email subject,” “list available connectors”)
- Privacy Constraints: {PRIVACY} (e.g., “no secrets in chat,” “redact PII”)
- Output Format: {FORMAT} (e.g., bullet list, table, code file)
- Timeframe/Freshness: {FRESHNESS} (e.g., “as of YYYY-MM-DD”)

**Process:**
1) Confirm tool availability vs. request; state whether the task is directly doable *in this chat*.
2) If not directly doable, present 2–3 viable paths (e.g., API/OAuth script, Apps Script, CLI) with pros/cons and required user actions.
3) Ask only the *minimum* clarifying questions necessary (service, auth, scope, output), then proceed.
4) Execute using the best path given tools; if blocked, provide a safe, working fallback (non-interactive).
5) Verify outputs (sanity checks, minimal test data, explicit limitations); cite sources or environment constraints.
6) Deliver the result in {FORMAT} plus a brief “Next Steps” block.

**Quality Checks:**
- Is the method executable without interactive stdin? If not, offer a non-interactive variant.
- Are secrets excluded/redacted? If code needs creds, use environment variables or OAuth flows.
- Did I cite sources/tool constraints or state that none are available?
- Did I keep it concise and structured as requested?

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
