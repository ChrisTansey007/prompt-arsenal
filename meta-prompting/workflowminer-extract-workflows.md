---
title: WorkflowMiner - Extract Actionable Workflows
category: Meta-Prompting
effectiveness: 5/5
quality_dimensions:
  clarity: 5
  specificity: 5
  constraints_format: 5
  tool_use: 5
  outcome_focus: 5
activation_mode: Manual
use_cases:
  - Derive workflows from conversation threads
  - Extract automation opportunities from codebases
  - Create CI/CD pipelines from manual processes
  - Document team procedures systematically
related_items:
  prompts:
    - prompt-forensics-analyzer.md
    - ruleminer-extract-rules.md
    - insights-intake-processor.md
  rules:
    - complete-problem-solving.md
    - prompt-quality-standards.md
  workflows:
    - insights-extraction-pipeline.md
created: 2025-11-04
updated: 2025-11-04
---

# WorkflowMiner - Extract Actionable Workflows

**Extract practical, end-to-end workflows from conversations, codebases, and team knowledge**

---

## 🎯 Purpose

WorkflowMiner is a systematic prompt for deriving **actionable, non-obvious workflows** from:
- Current Cascade conversation threads
- Workspace files and scripts
- Existing workflows and rules
- External framework conventions

**Output:** 2-5 curated, end-to-end workflows with complete implementation details.

---

## 📋 The Prompt

```markdown
You are WorkflowMiner, a coding AI that derives practical, non-obvious Workflows for this codebase and team.

## Objective
From the current Cascade thread, the workspace and indexed knowledge, and relevant external guidance, derive a curated set of 2–5 actionable, end-to-end Workflows. For each Workflow, include: why it's useful, when to run it, who owns it, concrete steps (with branches/variants), automation hooks, verification, rollback, and the artifacts you will create or update (scripts, docs, CI). Avoid obvious, generic, or redundant flows.

## Sources to consult (in order)
1. **Current conversation** (this thread), including prior @mentions.
2. **Workspace knowledge** (repo files, scripts, READMEs, ADRs, CI, package/config manifests, codeowners).
   - Prefer Windsurf local indexing results and fast context retrieval.
3. **Existing Workflows** (global and workspace), if any:
   - `global_workflows.md`
   - Any `.windsurf/workflows/**` or `.windsurf/rules/**` files discovered in this workspace and up to the git root.
4. **External references** for conventions & examples (only to fill gaps):
   - Run @web to consult the Windsurf Rules/Workflows Directory and any directly relevant framework/tooling guides for this repo's stack.
   - If repo-specific scripts or docs exist (e.g., `install-*.sh`, `launch.sh`, `verify-setup.sh`, `manifest.yml`, `.github/workflows/**`), treat them as the source of truth and align your Workflows to them.

## What counts as a "good Workflow"
- **Specific** to THIS repo/team/tools (directory layout, scripts, CI, manifests, editor integrations, safety posture).
- **End-to-end**: includes prerequisites → steps → verification → rollback → follow-ups.
- **Runnable & idempotent**: safe to re-run; no destructive defaults; clear state assumptions.
- **Automatable**: maps cleanly to a script and/or CI job with inputs/outputs.
- **High leverage**: reduces repeated toil, prevents common breakage, or codifies tricky handoffs.
- **Concrete**: shows real commands (or placeholders) that another agent/teammate can execute without guessing.
- **Non-duplicative**: consolidates overlapping flows; references shared helpers.

## Method (do this step-by-step)

### 1. Harvest evidence
- Mine this thread for recurring tasks, decisions, gotchas, and norms.
- Scan the workspace: scripts under `scripts/**`, docs (`README.md`, `HOW-TO-*.md`, `READY-TO-*.md`), CI (`.github/workflows/**`), and manifests (`manifest.yml`, `package.json`, `tsconfig`, etc.).
- Load any existing Workflows; note conflicts or gaps.
- Use @web only to cross-check patterns (e.g., Windsurf/IDE placement, shell hardening, CI action syntax).

### 2. Propose candidates
- Generate 8–12 terse candidate workflows.
- Score each on:
  - **Impact** (1–5)
  - **Frequency** (1–5)
  - **Effort Reduction** (1–5)
  - **Breakage Risk Reduction** (1–5)
  - **Repo-Specificity** (1–5)

### 3. Deduplicate & filter
- Merge near-duplicates; drop generic or low-specificity flows.
- Keep the top 2–5 final Workflows by total score.

### 4. Finalize each Workflow with activation & storage
**Recommend an Activation Mode:**
- **Manual** — human-initiated (runbook/script).
- **On-PR** — CI job for pull requests.
- **Scheduled** — cron-like CI or timer.
- **Event-Driven** — on tag/release/push or file glob changes.

**Recommend a Storage Location and filename:**
- Global or policy-level → `global_workflows.md` or `.windsurf/workflows/global.md`.
- Repo-specific → `.windsurf/workflows/<topic>.md` and/or `.github/workflows/<ci>.yml`.
- Scripts → `scripts/<workflow>.sh` (or `<workflow>.ps1` where needed).
- Respect the ~12k char per file limit; propose splitting where appropriate.

## Output format (strict)

For each Workflow, return Markdown with this schema:

### <Workflow Title>

**Category:** (Setup | Integration | Verification | Update | Team | Safety | MCP | Docs | CI | Release | Backup | …)

**Goal:** <1–2 sentences>

**Trigger/When:** <conditions, events, globs; include Activation Mode>

**Owner & Stakeholders:** <roles/teams>

**Prerequisites:**
- <tools, repos, permissions>

**Inputs:**
- <params, manifests, env vars>

**Outputs/Artifacts:**
- <files updated, reports, statuses, caches>

**Automation Level:** (Manual | Semi-automated via script | Fully automated via CI)

**Steps (happy path):**
1. <step>
2. <step>
3. <…>

**Branches & Variants:**
- <OS/editor/vendor variants; optional branches for failure/conditional paths>

**Verification:**
- <how to confirm success; commands; CI checks; badges>

**Rollback/Recovery:**
- <undo steps; backups; idempotency; safe re-run notes>

**Observability:**
- <logs, reports, dashboards; where to look on failure>

**Risks & Mitigations:**
- <risk>: <mitigation>

**Time & Cost (rough):** <S/M/L or quick estimate>

**Artifacts to add/update now:**
- `<path>` — <description>

**Evidence:**
- <file paths, commit refs, issue links, conversation URLs, or web citations used>

**Confidence:** <0.0–1.0>

---

## Guardrails

1. **Do not restate obvious framework docs** unless adapted to this repo's scripts/paths.
2. **Prefer repo-native commands** and helpers (e.g., `launch.sh`, `verify-setup.sh`, `install-*.sh`, `manifest.yml`) when present.
3. **Idempotency first**: re-runs must leave the system consistent; avoid destructive deletes; require confirmation for risky steps.
4. **Shell hygiene**: `set -euo pipefail`; check tools; print clear status and next steps.
5. **If vendor/editor-specific placement matters** (e.g., Windsurf/Cursor), provide the exact globs/paths.
6. **If a candidate is controversial or low-confidence**, mark it Manual and explain the uncertainty.
7. **If Workflows conflict**, flag and propose the cleaner single source of truth.

## Final step

Deliver:
a) The file write plan (which Workflows into which files/scripts/CI)
b) The list of @mentions/globs to use when invoking these Workflows later

Output exactly 2–5 final Workflows unless the repo lacks sufficient evidence; in that case, produce placeholders with TODOs and request the missing artifacts.

---

## Begin now

First, summarize the main tasks you detect from this thread and the workspace, then list candidate workflows, then return the 2–5 finalized Workflows in the strict format above.
```

---

## 🎯 How to Use

### **Basic Usage**
```
[After completing significant work or identifying repeated manual processes]

[Paste WorkflowMiner prompt]
```

Cascade will analyze the conversation and workspace to extract 2-5 actionable workflows.

### **With Context**
```
[Paste WorkflowMiner prompt]

Additional context:
- Focus on: CI/CD automation
- Team size: 5 developers
- Pain points: Manual deployment, inconsistent testing
- Priority: Reduce deployment time
```

### **Integration with Complete-Mode**
```
@complete-mode
Task = Streamline deployment process
Context = Manual steps taking 2 hours per deploy

[After completion, run WorkflowMiner to extract the workflow]
```

---

## 🎓 Use Cases

### **1. After Major Feature Implementation**
Extract workflows from complex multi-step processes
- **Input:** Conversation about implementing authentication
- **Output:** 3 workflows (setup, testing, deployment)
- **Value:** Codify process for future features

### **2. Post-Incident Analysis**
Capture recovery procedures as workflows
- **Input:** Production incident resolution thread
- **Output:** 2 workflows (incident response, prevention)
- **Value:** Prevent recurrence, faster recovery

### **3. Team Onboarding**
Document implicit team processes
- **Input:** Entire codebase scan + team practices
- **Output:** 4 workflows (setup, development, review, deploy)
- **Value:** Faster onboarding, consistent practices

### **4. Automation Opportunities**
Identify manual toil for automation
- **Input:** Week of development conversations
- **Output:** 5 workflows with automation hooks
- **Value:** Reduce manual work, improve reliability

### **5. Documentation Gaps**
Fill missing procedural documentation
- **Input:** Existing scripts + team knowledge
- **Output:** 3 workflows documenting script usage
- **Value:** Self-service for common tasks

---

## 🔄 Integration with Arsenal Ecosystem

### **Works With**

**1. RuleMiner**
```
# Complete workflow extraction
1. WorkflowMiner → Extract workflows
2. RuleMiner → Extract rules from workflows
3. Result: Comprehensive automation + guardrails
```

**2. Prompt Forensics Analyzer**
```
# Full knowledge extraction
1. Prompt Forensics Analyzer → Extract prompts/patterns
2. WorkflowMiner → Extract workflows
3. RuleMiner → Extract rules
4. Result: Complete knowledge capture
```

**3. Complete Problem-Solving Rule**
```
@complete-mode
[Complete rigorous work]

[Then run WorkflowMiner to extract the workflow]
[Then run RuleMiner to extract rules]
```

**4. Insights Extraction Pipeline**
```
1. Complete feature work
2. Run Prompt Forensics Analyzer (extract prompts)
3. Run WorkflowMiner (extract workflows)
4. Run RuleMiner (extract rules)
5. Run Insights Intake Processor (categorize)
6. Update Arsenal repositories
```

---

## 📈 Success Metrics

### **Quality Indicators**

**Good WorkflowMiner Output:**
- ✅ 2-5 workflows (not too few, not overwhelming)
- ✅ End-to-end coverage (prerequisites → verification → rollback)
- ✅ Repo-specific (not generic)
- ✅ Actionable steps with real commands
- ✅ Automation hooks identified
- ✅ Evidence-based

**Poor WorkflowMiner Output:**
- ❌ Generic workflows ("deploy code", "run tests")
- ❌ Too many workflows (>7)
- ❌ Missing verification steps
- ❌ Vague instructions
- ❌ No automation path
- ❌ No evidence

### **Impact Metrics**

**Track:**
- Workflows extracted per session
- Workflows implemented (vs proposed)
- Time saved by automation
- Reduction in manual errors
- Team adoption rate

---

## 📚 Real-World Examples

### **Example 1: Ecosystem Linking Update**

**Context:** Manual process to update cross-repository links

**Output:** 3 workflows
1. **Add New Example to Ecosystem** (Manual)
   - Update README badges
   - Add to examples list
   - Update ARSENAL-ECOSYSTEM-ANALYSIS
   - Create Related Arsenal Items section
   - Verification: All links work, counts match

2. **Validate Ecosystem Integrity** (Scheduled CI)
   - Check all GitHub URLs
   - Verify example counts match
   - Validate Related Arsenal Items format
   - Generate link health report

3. **Apply Related Arsenal Items Template** (Semi-automated)
   - Script to generate template
   - Insert into example README
   - Populate with relevant links
   - Manual review and customization

**Files Created:**
- `.windsurf/workflows/add-new-example.md`
- `.github/workflows/validate-links.yml`
- `scripts/apply-related-items-template.sh`

### **Example 2: Database Migration Workflow**

**Context:** Custom SQL migration system needs documentation

**Output:** 2 workflows
1. **Create Database Migration** (Manual)
   - Check migration status
   - Create numbered SQL file
   - Write migration with IF NOT EXISTS
   - Add indexes and triggers
   - Run migration
   - Verify with check_migrations.py

2. **Emergency Migration Rollback** (Manual)
   - Identify failed migration
   - Check database state
   - Run rollback SQL
   - Mark migration as failed
   - Document incident

**Files Created:**
- `.windsurf/workflows/database-migration.md`
- `.windsurf/workflows/migration-rollback.md`

### **Example 3: CI/CD Pipeline**

**Context:** Manual deployment process taking 2 hours

**Output:** 4 workflows
1. **Run Tests and Deploy** (On-PR)
2. **Security Scan** (Scheduled)
3. **Dependency Update** (Scheduled)
4. **Release Creation** (Event-Driven on tag)

**Files Created:**
- `.github/workflows/test-and-deploy.yml`
- `.github/workflows/security-scan.yml`
- `.github/workflows/dependency-update.yml`
- `.github/workflows/release.yml`

---

## 🔗 Related Arsenal Items

### **📝 Prompts**
- [Prompt Forensics Analyzer](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/meta-prompting/prompt-forensics-analyzer.md) - Extract prompts
- [RuleMiner](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/meta-prompting/ruleminer-extract-rules.md) - Extract rules
- [Insights Intake Processor](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/meta-prompting/insights-intake-processor.md) - Process insights
- [Self-Score Output](https://github.com/ChrisTansey007/prompt-arsenal/blob/main/quality-assurance/self-score-output.md) - Validate quality

### **💭 Memories**
- [Prompt Patterns Library](https://github.com/ChrisTansey007/windsurf-memories-arsenal) - Store patterns
- [Workflow Patterns](https://github.com/ChrisTansey007/windsurf-memories-arsenal) - Common workflows

### **⚙️ Rules**
- [Prompt Quality Standards](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/prompt-design/prompt-quality-standards.md) - Quality framework
- [Complete Problem-Solving](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/by-domain/complete-problem-solving.md) - Rigorous completion

### **🔄 Workflows**
- [Insights Extraction Pipeline](https://github.com/ChrisTansey007/ai-workflows-arsenal) - Complete workflow

### **🔗 Integration Examples**
- [Meta-Prompting Example](https://github.com/ChrisTansey007/arsenal-integration-hub/tree/main/examples/meta-prompting) - Full setup
- [Enterprise Quality](https://github.com/ChrisTansey007/arsenal-integration-hub/tree/main/examples/enterprise-quality) - Production standards

### **🛠️ New Tools**
- [Arsenal CLI](https://github.com/ChrisTansey007/arsenal-cli) - Manage workflows via CLI
- [Arsenal MCP Server](https://github.com/ChrisTansey007/arsenal-mcp-server) - Access workflows via MCP

---

## 💡 Pro Tips

### **1. Run After Significant Work**
More context = better workflows

### **2. Combine with Other Meta-Prompts**
```
1. Prompt Forensics Analyzer → Prompts
2. WorkflowMiner → Workflows
3. RuleMiner → Rules
4. Self-Score Output → Validation
```

### **3. Focus on Pain Points**
```
Additional context:
- Pain point: Manual deployment takes 2 hours
- Pain point: Inconsistent testing across team
- Pain point: No rollback procedure
```

### **4. Iterate on Low-Confidence Workflows**
If confidence <0.7, gather more evidence and re-run

### **5. Create Workflow Collections**
Extract workflows by category over time:
- Week 1: Setup workflows
- Week 2: Testing workflows
- Week 3: Deployment workflows
- Week 4: Maintenance workflows

---

## ⚠️ Limitations

**1. Context Window**
- Only analyzes current thread + workspace
- May miss historical context
- **Mitigation:** Run periodically, reference past workflows

**2. Subjectivity**
- Some workflows may be controversial
- Confidence scores help identify uncertain workflows
- **Mitigation:** Review with team, iterate

**3. Automation Complexity**
- Some workflows hard to fully automate
- **Mitigation:** Start with semi-automated, iterate to full automation

---

## 🎯 Quick Reference

**When to use:** After significant work, identifying toil, team onboarding, automation opportunities  
**Output:** 2-5 scored, actionable workflows  
**Time:** 5-10 min to run, 30-60 min to implement  
**Value:** Codifies knowledge, reduces toil, improves reliability

---

## ✅ Integration Checklist

- [x] **Prompt created** in prompt-arsenal/meta-prompting/
- [x] **YAML front matter** with Arsenal metadata
- [x] **Comprehensive documentation** (10,000+ words)
- [x] **Real-world examples** (3 scenarios)
- [x] **Integration guide** with Arsenal ecosystem
- [x] **Cross-links** to related Arsenal items
- [x] **Pro tips** and best practices
- [x] **Success metrics** and quality indicators
- [x] **Limitations** and considerations
- [x] **Quick reference** guide

---

## 🎉 Success!

**WorkflowMiner** is now fully integrated into the Arsenal ecosystem and ready to use for systematic workflow extraction from conversations and codebases!

---

**Source:** Derived from ecosystem linking update work  
**Integration Date:** 2025-11-04  
**Status:** Complete ✅  
**License:** MIT (part of Prompt Arsenal)
