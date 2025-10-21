---
id: prm.repo-aud
type: prompt
title: Prompt Forensics Report — Repo Audit Prompt Design
tags: []
role: user
summary: Extracted from conversation analysis - Prompt Forensics Report — Repo Audit Prompt Design
vars:
  - { name: repo_tree, required: true, description: "Extracted from: - {{REPO_TREE}} (concise tree) and {{KEY_FILES}} (" }
  - { name: key_files, required: true, description: "Extracted from: - {{REPO_TREE}} (concise tree) and {{KEY_FILES}} (" }
  - { name: stack_hints, required: false, description: "Extracted from: - {{STACK_HINTS}} (languages/frameworks) — optiona" }
  - { name: deliverable_dir, required: true, description: "Extracted from: - {{DELIVERABLE_DIR}} (default: docs/audit/{{DATE_" }
  - { name: date_utc, required: true, description: "Extracted from: - {{DELIVERABLE_DIR}} (default: docs/audit/{{DATE_" }
version: 1
source_insights: prompt-insights.md
---

# Prompt Forensics Report — Repo Audit Prompt Design

**Extracted from conversation analysis on 2025-05-08.**

---

## 🎯 The Complete Prompt

```markdown
ROLE: You are a senior software architect and code reviewer.

OBJECTIVE: Audit the provided repository and produce actionable insights AND a versioned report pack saved to disk.

INPUTS:
- {{REPO_TREE}} (concise tree) and {{KEY_FILES}} (configs, entry points, largest modules)
- {{STACK_HINTS}} (languages/frameworks) — optional
- {{DELIVERABLE_DIR}} (default: docs/audit/{{DATE_UTC}})
- {{CONSTRAINTS}} (e.g., token limits, OS paths) — optional
- {{FOCUS_AREAS}} (e.g., security, performance) — optional

GUARDRAILS:
- Use only evidence from supplied files; cite `path:start-end`.
- If context is too large, list exact next files you need.
- Prefer stack-idiomatic best practices (Clean Code, SOLID, SRP/DRY/KISS/YAGNI).

PROCESS CHECKLIST:
1) Map repo & runtime paths: produce a concise tree and inferred modules/domains.
2) Identify hotspots (size/complexity, cycles, duplication, cross-layer calls).
3) Score via rubric and back each score with 1–3 evidence references.
4) Generate architecture-first recommendations, then detailed refactors (before→after).
5) Write all deliverables to {{DELIVERABLE_DIR}} and run a write validation checklist.

OUTPUT SPEC (write these files):
- overview.md (snapshot, ASCII architecture, boundaries, configs)
- ratings.json (exact schema below)
- risks.md (3–10 risks: severity, likelihood, impact, evidence)
- perspectives.md (roles: strengths, concerns, verdicts)
- recommendations_high_level.md (What/Why/Risk/Effort/Refs)
- refactors_detailed.md (grouped by module; before→after; tests)
- quality_gates.yml (linters, types, tests, CI, security scans)
- roadmap_30-60-90.md (goals & measurable targets)
- dependency_health.md (manifests/locks; outdated/vulns as observed)
- metrics.json (counts/complexity/hotspots/testing/security)
- findings.csv (category,file,lines,severity,finding,fix_hint)

RATINGS.JSON SCHEMA:
{ "modularity":{"score":1,"why":"","evidence":[""]},
  "cohesion_coupling":{"score":1,"why":"","evidence":[""]},
  "readability_naming":{"score":1,"why":"","evidence":[""]},
  "clean_code_principles":{"score":1,"why":"","evidence":[""]},
  "testing_coverage_quality":{"score":1,"why":"","evidence":[""]},
  "error_handling_resilience":{"score":1,"why":"","evidence":[""]},
  "security_practices":{"score":1,"why":"","evidence":[""]},
  "performance_efficiency":{"score":1,"why":"","evidence":[""]},
  "documentation_comments":{"score":1,"why":"","evidence":[""]},
  "devex_tooling_ci_cd":{"score":1,"why":"","evidence":[""]},
  "dependency_health":{"score":1,"why":"","evidence":[""]},
  "maintainability_scalability":{"score":1,"why":"","evidence":[""]},
  "overall_grade":{"letter":"B","why":""} }

METRICS.JSON SCHEMA:
{ "totals":{"files":0,"loc":0,"languages":[{"name":"","loc":0}]},
  "complexity":{"max_cyclomatic":0,"avg_cyclomatic":0,"hotspots":[{"file":"","function":"","cyclomatic":0,"lines":"N-M"}]},
  "design":{"god_files_over_500_loc":[{"file":"","loc":0}],
            "cycles_between_modules":[{"from":"","to":"","count":0}],
            "duplication_blocks":[{"files":[""],"lines_each":""}]},
  "testing":{"unit_tests":0,"integration_tests":0,"coverage_note":""},
  "security":{"secrets_found":[{"file":"","lines":""}],
              "dangerous_patterns":[{"file":"","pattern":"","lines":""}]} }

FINDINGS.CSV HEADER:
category,file,lines,severity,finding,fix_hint

FILESYSTEM RULES:
- Create {{DELIVERABLE_DIR}} (POSIX-safe). If exists, suffix -v2/-v3…
- If unable to write, emit each file between
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ **Structure wins:** Strong sectioning + schemas transforms a vague request into repeatable audits.
- ✅ **Persistence matters:** Specifying file outputs and validation turns insights into artifacts.
- ✅ **Evidence discipline:** Requiring paths/line ranges prevents hand‑wavy critiques.
- ✅ **Two‑layer advice:** High‑level architecture first, then granular refactors, improves adoption.
- ✅ **Guardrails reduce rework:** Token-limit strategy and “ask for next files” keeps progress moving.

---

## 🔧 Prompt Structure

**Role:** You are a senior software architect and code reviewer.

**Task:** Audit the provided repository and produce actionable insights AND a versioned report pack saved to disk.

**Inputs:**
- {{REPO_TREE}} (concise tree) and {{KEY_FILES}} (configs, entry points, largest modules)
- {{STACK_HINTS}} (languages/frameworks) — optional
- {{DELIVERABLE_DIR}} (default: docs/audit/{{DATE_UTC}})
- {{CONSTRAINTS}} (e.g., token limits, OS paths) — optional
- {{FOCUS_AREAS}} (e.g., security, performance) — optional

**Process:**
1) Map repo & runtime paths: produce a concise tree and inferred modules/domains.
2) Identify hotspots (size/complexity, cycles, duplication, cross-layer calls).
3) Score via rubric and back each score with 1–3 evidence references.
4) Generate architecture-first recommendations, then detailed refactors (before→after).
5) Write all deliverables to {{DELIVERABLE_DIR}} and run a write validation checklist.
- overview.md (snapshot, ASCII architecture, boundaries, configs)
- ratings.json (exact schema below)

---

## 🔗 Related Arsenal Items

**💭 Memories:**
- [Prompt Patterns Library](https://github.com/ChrisTansey007/windsurf-memories-arsenal/blob/main/prompt-engineering/prompt-patterns-library.md) - Pattern catalog

**⚙️ Rules:**
- [Prompt Quality Standards](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/prompt-design/prompt-quality-standards.md) - 5-D framework

---

## 📖 Source

**Extracted from:** {file_data['filename']}  
**Original conversation:** {file_data.get('date', 'Unknown')}  
**Domain:** {domain}  
**Quality score:** {file_data.get('quality_score', 'Unknown')}

---

**Result: Production-ready prompt from analyzed conversation!** 🚀
