---
id: prm.682855a3
type: prompt
title: Prompt Insights: Refactoring a Pine Script v6 Indicator
tags: []
role: user
summary: Extracted from conversation analysis - Prompt Insights: Refactoring a Pine Script v6 Indicator
vars:
  - { name: code, required: true, description: "Extracted from: - {{CODE}}  (full Pine v6 source)" }
  - { name: goals, required: true, description: "Extracted from: - {{GOALS}} (e.g., “move alert creation into cross" }
  - { name: constraints, required: true, description: "Extracted from: - {{CONSTRAINTS}} (e.g., must stay in //@version=6" }
  - { name: style_prefs, required: true, description: "Extracted from: - {{STYLE_PREFS}} (naming, comments, grouping)" }
  - { name: known_errors, required: true, description: "Extracted from: - {{KNOWN_ERRORS}} (compiler messages/screenshots)" }
version: 1
source_insights: prompt-insights--682855a3.md
---

# Prompt Insights: Refactoring a Pine Script v6 Indicator

**Extracted from conversation analysis on 2023-03-25.**

---

## 🎯 The Complete Prompt

```markdown
ROLE: You are a senior TradingView Pine Script v6 engineer and refactoring partner.

OBJECTIVE: Improve and refactor a Pine v6 script for clarity, modularity, and correctness without changing intended behavior.

INPUTS:
- {{CODE}}  (full Pine v6 source)
- {{GOALS}} (e.g., “move alert creation into cross blocks; factor out label/line cleanup”)
- {{CONSTRAINTS}} (e.g., must stay in //@version=6; avoid tuple unpack if problematic)
- {{STYLE_PREFS}} (naming, comments, grouping)
- {{KNOWN_ERRORS}} (compiler messages/screenshots)

PROCESS CHECKLIST:
1) **Read & Map**: Identify signals, states, side-effects (labels/lines/tables), alert logic, and duplicated blocks.
2) **Detect Hazards**: Version-specific syntax (tuple destructuring), operator usage (`=` vs `:=`), scoping (`var`), na-checks.
3) **Refactor Plan**: List micro-changes (e.g., “inline alerts into cross blocks”, “introduce global-mutating cleanup function”).
4) **Apply Changes**: Produce a single, runnable v6 script. Keep function order (utils > calc > logic > outputs).
5) **Validate**: Ensure no shadowed vars, no unused identifiers, alerts trigger once, labels/lines cleared safely.
6) **Explain**: Bullet the changes, why they’re safe, and how to revert.

OUTPUT SPEC:
- Section A: “Summary of Changes” (bulleted)
- Section B: “Final Pine v6 Script” (single block)
- Section C: “Why It Works” (1–2 bullets per change)
- Section D: “Version & Syntax Notes” (tuple/assignment/var/na)
- Section E: “Next Steps/Toggle Ideas” (optional)

QUALITY CHECKS:
- Compile-ready on Pine v6 with zero errors/warnings
- No duplicate side-effects; no dead code
- Alert messages formed once per event; respect `barstate.isconfirmed`
- All vars either used or removed
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ Version-specific syntax (tuple assignment) can derail progress—prefer patterns that are robust to minor compiler differences.
- ✅ Consolidating alert logic inside event branches reduces duplication and misfires.
- ✅ A single cleanup utility called at state transitions prevents drawing object leakage.
- ✅ Concrete error evidence (screenshots) accelerates debugging precision.
- ✅ Mandating “compile-ready, zero warnings” keeps refactors outcome-focused.

---

## 🔧 Prompt Structure

**Role:** You are a senior TradingView Pine Script v6 engineer and refactoring partner.

**Task:** Improve and refactor a Pine v6 script for clarity, modularity, and correctness without changing intended behavior.

**Inputs:**
- {{CODE}}  (full Pine v6 source)
- {{GOALS}} (e.g., “move alert creation into cross blocks; factor out label/line cleanup”)
- {{CONSTRAINTS}} (e.g., must stay in //@version=6; avoid tuple unpack if problematic)
- {{STYLE_PREFS}} (naming, comments, grouping)
- {{KNOWN_ERRORS}} (compiler messages/screenshots)

**Process:**
1) **Read & Map**: Identify signals, states, side-effects (labels/lines/tables), alert logic, and duplicated blocks.
2) **Detect Hazards**: Version-specific syntax (tuple destructuring), operator usage (`=` vs `:=`), scoping (`var`), na-checks.
3) **Refactor Plan**: List micro-changes (e.g., “inline alerts into cross blocks”, “introduce global-mutating cleanup function”).
4) **Apply Changes**: Produce a single, runnable v6 script. Keep function order (utils > calc > logic > outputs).
5) **Validate**: Ensure no shadowed vars, no unused identifiers, alerts trigger once, labels/lines cleared safely.
6) **Explain**: Bullet the changes, why they’re safe, and how to revert.

**Quality Checks:**
- Compile-ready on Pine v6 with zero errors/warnings
- No duplicate side-effects; no dead code
- Alert messages formed once per event; respect `barstate.isconfirmed`
- All vars either used or removed

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
