---
id: prompt.ruleminer
type: prompt
title: RuleMiner - Extract Codebase Rules from Conversations
tags: [meta-prompting, rules, extraction, codebase-analysis, knowledge-mining, automation]
summary: Systematically extract actionable, repo-specific Rules from Cascade conversations and workspace knowledge. Derives practical, non-obvious rules with activation modes and storage recommendations.
effectiveness: 5/5
quality_dimensions:
  clarity: 5
  specificity: 5
  constraints_format: 5
  tool_use: 5
  outcome_focus: 5
version: 1
author: Community Contribution
last_updated: 2025-10-31
use_cases: [rule-extraction, codebase-analysis, team-standards, knowledge-capture, automation]
---

# RuleMiner - Extract Codebase Rules from Conversations

**Extract actionable, repo-specific Rules from Cascade threads and workspace knowledge.**

---

## 🎯 What This Prompt Does

**RuleMiner** systematically analyzes:
- Current Cascade conversation thread
- Workspace files and configurations
- Existing rules (global and workspace)
- External framework conventions

**Output:** Curated set of 8-20 actionable Rules with:
- Activation modes (Always On, Manual, Model Decision, Glob)
- Storage locations (global vs workspace-specific)
- Evidence and confidence scores
- Concrete playbooks for future use

---

## 📋 The Prompt

```markdown
You are **RuleMiner**, a coding AI that derives practical, non-obvious Rules for this codebase and team.

## Objective
From the **current Cascade thread**, the **workspace and indexed knowledge**, and relevant **external guidance**, derive a curated set of *actionable Rules*. For each Rule, include: why it's useful, when to apply it, and how to apply it in future conversations/edits. Avoid obvious, generic, or redundant rules.

## Sources to consult (in order)
1) Current conversation (this thread), including prior @mentions.
2) Workspace knowledge (files, docs, READMEs, ADRs, lint configs, CI, package.json, tsconfig, codeowners, etc.).
   - Prefer Windsurf's local indexing results and fast context retrieval.
3) Existing Rules (global and workspace):
   - `global_rules.md` 
   - Any `.windsurf/rules/**` files discovered in this workspace and up to the git root.
4) External references for conventions & examples:
   - Run `@web` to consult the Windsurf Rules Directory (https://windsurf.com/editor/directory) and any directly relevant framework/library style guides for the stack in this repo.

## What counts as a "good Rule"
- Specific to THIS repo/team/tools (naming, architecture, CI, testing stacks, API shapes, error handling, perf constraints, security posture).
- High leverage in preventing recurring issues or guiding uniformity.
- Concrete enough that another agent (or teammate) could follow without guessing.
- Non-duplicative; consolidate overlapping candidates into a single, clearer rule.

## Method (do this step-by-step)
1) **Harvest evidence**
   - Mine this thread for recurring decisions, "gotchas", resolutions, and norms.
   - Scan the workspace: look for config and conventions implied by code (imports, folder layout, linters, tests, infra).
   - Load existing Rules; mark conflicts or gaps.
   - Use `@web` for quick cross-checks (framework best practices; Windsurf directory examples).
2) **Propose candidates**
   - Generate ~15–40 terse candidate rules.
   - Score each on: Impact (1–5), Recurrence (1–5), Clarity (1–5), Repo-Specificity (1–5).
3) **Deduplicate & filter**
   - Merge near-duplicates; drop generic rules ("write good code", etc.).
   - Keep the top set by total score; target 8–20 final Rules.
4) **Finalize each Rule with activation & storage**
   - Recommend an **Activation Mode**:
     - Always On — fundamental standards we want everywhere.
     - Manual — niche instructions triggered via `@mention`.
     - Model Decision — natural-language condition.
     - Glob — file patterns (e.g., `apps/**/page.tsx`, `**/*.py`, `**/*.sql`).
   - Recommend a **Storage Location** and filename:
     - Global policy → `global_rules.md`.
     - Repo-specific or topic-specific → `.windsurf/rules/<topic>.md`.
   - Respect the **~12k char per file** limit; propose splitting if needed.

## Output format (strict)
Return **Markdown** with this schema for each rule:

### <Rule Title>
**Category:** (Architecture | Code Style | Testing | API | Security | Infra | Process | Docs | Data | Frontend | Backend | DevEx | …)  
**Rule:** <one or more short bullets with the instruction>  
**When to apply:** <clear conditions or globs; include "Activation Mode" suggestion>  
**Why this is good:** <1–3 bullets tying to issues/decisions/evidence>  
**How to use in the future (playbook):**  
- <concrete steps or checklist the agent should follow>  
**Anti-patterns:** <common mistakes to avoid>  
**Evidence:** <file paths, commit refs, issue links, conversation URLs, or web citations used>  
**Confidence:** <0.0–1.0>  

## Guardrails
- Do NOT restate obvious framework docs unless adapted to this repo.
- Prefer bullets, headings, and short checklists over paragraphs.
- If a candidate is controversial or low-confidence, mark it Manual.
- If Rules conflict, flag and propose the cleaner single source of truth.

## Final step
- Propose: a) the **file write plan** (which rules into which files), and b) the list of **@mentions/globs** to use when invoking the Rules later.

Begin now. First, summarize the main patterns you detect from this thread and the workspace, then list candidate rules.
```

---

## 💡 How to Use

### Basic Usage

```
[Paste the RuleMiner prompt into Cascade after completing work on a feature/fix]
```

Cascade will:
1. Analyze the conversation thread
2. Scan workspace files and configs
3. Review existing rules
4. Consult external references (@web)
5. Generate 8-20 scored, actionable rules
6. Recommend activation modes and storage locations

### Advanced Usage with Context

```
[After a complex feature implementation or bug fix session]

RuleMiner prompt:
[Paste full prompt above]

Additional context:
- Focus on: [API design / Testing / Security / Performance]
- Team size: [Solo / Small team / Large team]
- Compliance needs: [None / GDPR / SOC2 / HIPAA]
```

---

## 📊 Output Example

**What you get:**

```markdown
### API Response Standardization

**Category:** API  
**Rule:**
- All API responses must use the standard envelope: `{ success: boolean, data?: T, error?: { code: string, message: string } }`
- Error codes follow format: `<DOMAIN>_<ERROR_TYPE>` (e.g., `AUTH_INVALID_TOKEN`)
- HTTP status codes: 200 (success), 400 (client error), 500 (server error)

**When to apply:** 
- Activation Mode: Glob `api/**/*.ts`
- Apply to all API endpoint handlers

**Why this is good:**
- Consistent error handling across frontend and backend
- Type-safe responses with TypeScript
- Easier debugging with structured error codes

**How to use in the future (playbook):**
1. When creating new API endpoint, copy response envelope type
2. Use helper function `createApiResponse(data)` or `createApiError(code, message)`
3. Ensure all error paths return proper envelope
4. Add error code to error-codes.md documentation

**Anti-patterns:**
- ❌ Returning raw data without envelope
- ❌ Inconsistent error formats across endpoints
- ❌ Generic error messages without codes

**Evidence:**
- api/users/route.ts (lines 45-67)
- api/auth/route.ts (lines 23-34)
- types/api.ts (envelope definition)
- Thread discussion: "standardize API responses" (2025-10-28)

**Confidence:** 0.95

---

### Test Coverage for Critical Paths

**Category:** Testing  
**Rule:**
- Payment processing: ≥95% coverage
- Authentication: ≥90% coverage
- Data migrations: 100% coverage (integration tests)
- All other: ≥80% coverage

**When to apply:**
- Activation Mode: Always On
- Enforced by CI (coverage gates)

**Why this is good:**
- Prevents regressions in revenue-critical code
- Catches security issues before production
- Provides confidence for refactoring

**How to use in the future (playbook):**
1. Before implementing critical feature, write tests first (TDD)
2. Run `npm run test:coverage` to check current coverage
3. If below threshold, add tests before PR
4. CI will block merge if coverage drops

**Anti-patterns:**
- ❌ Writing tests after implementation (often incomplete)
- ❌ Testing only happy paths
- ❌ Mocking everything (integration tests needed)

**Evidence:**
- jest.config.js (coverage thresholds)
- .github/workflows/ci.yml (coverage gates)
- Thread: "payment bug in production" (2025-10-15)

**Confidence:** 1.0
```

**File Write Plan:**
```
.windsurf/rules/api-standards.md (3 rules)
.windsurf/rules/testing-standards.md (2 rules)
.windsurf/rules/security-practices.md (4 rules)
global_rules.md (1 rule - code style)
```

**Activation Recommendations:**
```
Always On: code-style.md, security-practices.md
Glob api/**/*.ts: api-standards.md
Glob **/*.test.ts: testing-standards.md
Manual: advanced-performance.md (use @performance-rules)
```

---

## 🎯 When to Use RuleMiner

### Perfect For

**1. After Major Features**
- Extract patterns from complex implementations
- Codify decisions made during development
- Prevent future inconsistencies

**2. Post-Incident Analysis**
- Capture lessons learned from bugs/incidents
- Create preventive rules
- Document root causes and solutions

**3. Onboarding New Team Members**
- Extract implicit team knowledge
- Document unwritten conventions
- Create comprehensive rule set

**4. Codebase Audits**
- Identify inconsistencies across codebase
- Standardize approaches
- Create enforcement rules

**5. Framework Migrations**
- Document new patterns and conventions
- Deprecate old approaches
- Guide team through transition

---

## 🔄 Integration with Arsenal Ecosystem

### Works With

**1. Complete Problem-Solving Rule**
```
@complete-mode
Task = Extract rules from payment processing implementation
Context = 3-week feature; multiple gotchas discovered

[After completion, use RuleMiner to extract rules]
```

**2. Prompt Forensics Analyzer**
```
# First: Analyze conversation
[Use Prompt Forensics Analyzer]

# Then: Extract rules
[Use RuleMiner on same thread]

# Result: Prompts + Rules extracted
```

**3. Insights Extraction Pipeline**
```
1. Complete feature work
2. Run Prompt Forensics Analyzer (extract prompts/patterns)
3. Run RuleMiner (extract rules)
4. Update Arsenal repositories
```

---

## 📈 Success Metrics

### Quality Indicators

**Good RuleMiner Output:**
- ✅ 8-20 rules (not too few, not overwhelming)
- ✅ Confidence scores ≥0.7 average
- ✅ Specific to your codebase (not generic)
- ✅ Actionable playbooks (concrete steps)
- ✅ Evidence-based (file paths, commits, threads)
- ✅ Proper activation modes assigned

**Poor RuleMiner Output:**
- ❌ Generic rules ("write good code")
- ❌ Too many rules (>30, overwhelming)
- ❌ Low confidence (<0.5 average)
- ❌ Vague instructions
- ❌ No evidence provided

### Impact Metrics

**Track:**
- Number of rules extracted per session
- Rules actually implemented (vs proposed)
- Reduction in recurring issues
- Onboarding time improvement
- Code consistency scores

---

## 💡 Pro Tips

### 1. Run After Significant Work

```
# After completing a complex feature
[Work on feature for several hours/days]
[When done, paste RuleMiner prompt]
```

**Why:** More context = better rules

### 2. Combine with Other Meta-Prompts

```
# Full knowledge extraction workflow
1. Prompt Forensics Analyzer → Extract prompts/patterns
2. RuleMiner → Extract rules
3. Self-Score Output → Validate quality
```

### 3. Customize for Your Domain

```
Additional context for RuleMiner:
- Focus on: Security rules (we're in healthcare)
- Compliance: HIPAA required
- Team: 5 developers, 2 juniors
- Priority: Data privacy and audit trails
```

### 4. Iterate on Low-Confidence Rules

```
# If RuleMiner returns rules with confidence <0.7
1. Review the evidence
2. Gather more examples from codebase
3. Run RuleMiner again with additional context
```

### 5. Create Rule Collections

```
# Extract rules by category over time
Week 1: API rules (after API refactor)
Week 2: Testing rules (after test improvements)
Week 3: Security rules (after security audit)
Week 4: Performance rules (after optimization)

Result: Comprehensive rule library
```

---

## 🔗 Related Arsenal Items

### 📝 Prompts
- [Prompt Forensics Analyzer](./prompt-forensics-analyzer.md) - Extract prompts from conversations
- [Insights Intake Processor](./insights-intake-processor.md) - Process extracted insights
- [Self-Score Output](../quality-assurance/self-score-output.md) - Validate rule quality

### 💭 Memories
- [Prompt Patterns Library](https://github.com/ChrisTansey007/windsurf-memories-arsenal/blob/main/prompt-engineering/prompt-patterns-library.md) - Store extracted patterns
- [Enterprise Completion Standards](https://github.com/ChrisTansey007/windsurf-memories-arsenal/blob/main/quality-standards/enterprise-completion-standards-memory.md) - Team standards

### ⚙️ Rules
- [Prompt Quality Standards](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/prompt-design/prompt-quality-standards.md) - Quality framework
- [Complete Problem-Solving](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/by-domain/complete-problem-solving.md) - Rigorous completion

### 🔄 Workflows
- [Insights Extraction Pipeline](https://github.com/ChrisTansey007/ai-workflows-arsenal/blob/main/windsurf/meta-analysis/insights-extraction-pipeline.md) - Complete extraction workflow

### 🔗 Integration
- [Meta-Prompting Example](https://github.com/ChrisTansey007/arsenal-integration-hub/tree/main/examples/meta-prompting) - Complete meta-prompting setup

---

## 📚 Real-World Examples

### Example 1: After API Refactor

**Context:** Spent 2 days refactoring authentication API

**RuleMiner Input:**
```
[Paste RuleMiner prompt]

Additional context:
- Just refactored: Authentication API (JWT tokens, refresh tokens, session management)
- Stack: Next.js App Router, FastAPI backend, PostgreSQL
- Issues encountered: Token expiry handling, race conditions, error responses
```

**Output:** 12 rules extracted
- 4 API design rules (response envelopes, error codes)
- 3 Security rules (token storage, rotation, validation)
- 2 Testing rules (auth flow coverage, token edge cases)
- 2 Database rules (session cleanup, indexing)
- 1 Documentation rule (API changelog)

**Files Created:**
- `.windsurf/rules/api-auth-standards.md` (Always On)
- `.windsurf/rules/security-tokens.md` (Glob `api/auth/**/*.ts`)

---

### Example 2: Post-Production Incident

**Context:** Payment processing bug affected 100 transactions

**RuleMiner Input:**
```
[Paste RuleMiner prompt]

Additional context:
- Incident: Payment webhook race condition
- Root cause: Missing idempotency keys
- Fix: Added idempotency layer + retry logic
- Focus: Prevent similar issues
```

**Output:** 8 rules extracted
- 3 Payment processing rules (idempotency, webhooks, retries)
- 2 Monitoring rules (alerts, logging)
- 2 Testing rules (integration tests, load tests)
- 1 Incident response rule (runbook updates)

**Files Created:**
- `.windsurf/rules/payment-processing.md` (Glob `api/payments/**/*.ts`)
- `.windsurf/rules/incident-prevention.md` (Always On)

---

### Example 3: Team Onboarding

**Context:** New developer joining, need to extract implicit knowledge

**RuleMiner Input:**
```
[Paste RuleMiner prompt]

Additional context:
- Purpose: Onboarding documentation
- Scan entire codebase for patterns
- Focus: Code style, architecture, testing, deployment
- Team: 5 developers, various experience levels
```

**Output:** 15 rules extracted
- 5 Code style rules (naming, imports, file organization)
- 4 Architecture rules (folder structure, module boundaries)
- 3 Testing rules (coverage, test organization, mocking)
- 2 Deployment rules (CI/CD, environment variables)
- 1 Documentation rule (README standards)

**Files Created:**
- `.windsurf/rules/code-style.md` (Always On)
- `.windsurf/rules/architecture.md` (Always On)
- `.windsurf/rules/testing-standards.md` (Glob `**/*.test.ts`)
- `global_rules.md` (updated with team-wide standards)

---

## ⚠️ Limitations & Considerations

### Limitations

**1. Context Window**
- Can only analyze current thread + workspace
- May miss historical context from older conversations
- **Mitigation:** Run periodically, accumulate rules over time

**2. Subjectivity**
- Some rules may be controversial or team-dependent
- Confidence scores help identify uncertain rules
- **Mitigation:** Review low-confidence rules with team

**3. Duplication Risk**
- May propose rules similar to existing ones
- Requires manual review and deduplication
- **Mitigation:** RuleMiner checks existing rules, but manual review recommended

### Best Practices

**1. Review Before Implementing**
- Don't blindly accept all proposed rules
- Discuss controversial rules with team
- Adjust confidence thresholds

**2. Maintain Rule Hygiene**
- Periodically review and update rules
- Remove outdated rules
- Consolidate overlapping rules

**3. Balance Specificity and Generality**
- Too specific → brittle, hard to maintain
- Too general → not useful
- **Sweet spot:** Specific to your codebase, but adaptable

---

## 🎓 Advanced Techniques

### 1. Incremental Rule Building

```
# Week 1: Extract API rules
[Work on API features]
[Run RuleMiner focused on API]

# Week 2: Extract Testing rules
[Improve test coverage]
[Run RuleMiner focused on Testing]

# Week 3: Consolidate
[Review all rules, deduplicate, organize]
```

### 2. Rule Validation Loop

```
1. Extract rules with RuleMiner
2. Implement rules in .windsurf/rules/
3. Use rules for 1 week
4. Run RuleMiner again
5. Compare: Did new rules emerge? Are old rules still valid?
```

### 3. Cross-Repository Rule Mining

```
# For monorepos or multi-repo teams
1. Run RuleMiner in each repository
2. Compare extracted rules
3. Identify common patterns → global_rules.md
4. Identify repo-specific patterns → .windsurf/rules/
```

---

## 📊 Scoring System

### Rule Quality Dimensions

**Impact (1-5):**
- 5: Prevents critical bugs or major inconsistencies
- 3: Improves code quality moderately
- 1: Minor improvement

**Recurrence (1-5):**
- 5: Applies to every file/feature
- 3: Applies frequently
- 1: Rare edge case

**Clarity (1-5):**
- 5: Crystal clear, actionable playbook
- 3: Mostly clear, some interpretation needed
- 1: Vague or ambiguous

**Repo-Specificity (1-5):**
- 5: Unique to this codebase
- 3: Adapted from framework conventions
- 1: Generic best practice

**Total Score:** Sum of all dimensions (max 20)

**Keep rules with:** Total score ≥ 12

---

## ✅ Success Checklist

**Before Running RuleMiner:**
- [ ] Completed significant work (feature, refactor, bug fix)
- [ ] Thread has substantial context (not just "fix typo")
- [ ] Workspace has relevant files and configs
- [ ] Clear goal (extract API rules, security rules, etc.)

**After Running RuleMiner:**
- [ ] Review all proposed rules
- [ ] Check confidence scores (≥0.7 preferred)
- [ ] Verify evidence (file paths, commits exist)
- [ ] Deduplicate with existing rules
- [ ] Implement high-value rules first
- [ ] Test rules with new work
- [ ] Update rules based on feedback

---

## 🎯 Quick Reference

**When to use:** After significant work, post-incident, onboarding, audits  
**Output:** 8-20 scored, actionable rules with activation modes  
**Time:** 5-10 minutes to run, 20-30 minutes to review and implement  
**Value:** Codifies implicit knowledge, prevents recurring issues, improves consistency

**Remember:**
- Focus on repo-specific rules (not generic)
- Evidence-based (file paths, commits, threads)
- Actionable playbooks (concrete steps)
- Proper activation modes (Always On, Manual, Glob, Model Decision)

---

**Extract implicit knowledge and codify team standards systematically!** 🔍

---

## 📄 License & Attribution

**Source:** Community contribution  
**License:** MIT (part of Prompt Arsenal)  
**Version:** 1.0  
**Last Updated:** 2025-10-31
