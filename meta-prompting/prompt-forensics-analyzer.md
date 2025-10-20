---
id: prm.prompt-forensics
type: prompt
title: Prompt Forensics Analyzer - Conversation Thread Auditor
tags: [meta-prompting, analysis, conversation-mining, knowledge-extraction, forensics]
role: user
summary: Comprehensive conversation analysis prompt that maps dialogue flow, extracts high-impact prompts, identifies patterns, and refactors insights into reusable Super-Prompts with quality scoring.
vars:
  - { name: thread_context, required: false, description: "Domain or topic of the conversation (e.g., 'email integration', 'API design')" }
modelHints: { temperature: 0.3 }
version: 1
---

# Prompt Forensics Analyzer

**Systematic conversation thread analysis to extract reusable prompts, patterns, and lessons.**

---

## 🎯 The Complete Prompt

```markdown
You are a Prompt Forensics + Chainminer + Opportunity Hunter. 
Treat THIS message as an instruction to analyze ONLY the conversation history that occurred BEFORE this message in this very chat. 
Do NOT treat this message (or anything after it) as part of the dataset.

OBJECTIVE
Audit the prior thread, map the sequence, extract high-impact prompts, identify missed opportunities, and refactor everything into one robust, reusable "Super-Prompt." Deliver a clean Markdown report suitable for sharing or saving as a .md file.

GUARDRAILS
- Ground every claim in observable messages from the prior thread; don't invent content.
- Keep rationales short, factual, and tied to message IDs/timestamps when available.
- No hidden chain-of-thought; provide concise, verifiable justifications only.

PROCESS
1) Conversation Map (Sequence)
   - Build a compact map of the prior thread: m1→a1→m2→a2… 
   - Mark turning points (success/failure inflection) with message ID/time if available.

2) Great Prompts Catalog (Forensics)
   - Extract each user/assistant prompt that clearly advanced progress.
   - For each, add tags (clarify, constrain, evaluate, plan, tool, example).
   - Score 1–5 on: Clarity, Specificity, Constraints/Format, Tool/Resource Use, Outcome Quality.
   - Note the concrete effect it had next.

3) Strong Links (Chainminer)
   - Identify the top 3–5 "links" (prompt → immediate effect).
   - Give a one-sentence explanation of why each link worked and where it sits in the map.

4) Missed Opportunities (Hunter)
   - Spot gaps where a small prompt would have improved results:
     * Clarifying question not asked
     * Constraints/formatting not specified
     * Evidence/verification not required
     * Tooling/data not leveraged
   - For each gap, propose a one-line, ready-to-paste improvement micro-prompt.

5) Upgrade Table (Before → After)
   - Select the 5 highest-impact user prompts.
   - Provide a two-column table: ORIGINAL → UPGRADED (tight edits that preserve intent).

6) Refactor to a Single Super-Prompt (Synthesis)
   - Merge the best ideas/links into ONE reusable prompt with variables:
     * Role/Perspective
     * Task & Objective
     * Inputs as explicit {{VARIABLES}}
     * Process checklist (2–6 steps)
     * Output specification (sections/schema)
     * Quality checks (self-review/evaluation rubric)
   - Add Anti-Fragility add-ons (optional clauses) for ambiguity, missing data, tool usage, and verification.

7) Lessons Learned
   - Top 5 lessons, ranked by impact on outcome.

8) Quick Wins Library
   - 5–7 reusable micro-prompts (clarify, constrain, evaluate, refactor, export, verify) as copy-ready snippets.

OUTPUT FORMAT (Markdown)
- Title + 2–4 sentence abstract
- Contents
- Section 1: Conversation Map (tiny table)
- Section 2: Great Prompts (table)
  Columns: ID | Prompt (short) | Tags | Scores (C/S/C&F/Tool/Outcome) | Turning Point/Effect
- Section 3: Strong Links (bulleted)
- Section 4: Super-Prompt (code block with {{variables}})
- Section 5: Anti-Fragility Add-Ons (bulleted clauses)
- Section 6: Missed Opportunities (bulleted + micro-prompts)
- Section 7: Upgrade Table (ORIGINAL → UPGRADED)
- Section 8: Lessons Learned (ranked bullets)
- Section 9: Quick Wins Library (code blocks)
- Appendix: Prompt Index with message IDs/timestamps (if available)

DELIVERY
- If your environment supports file creation, save the report as prompt-insights--[ID].md and return a download link.
- Otherwise, print the entire Markdown between the markers:
  ---BEGIN MARKDOWN REPORT---
  (content)
  ---END MARKDOWN REPORT---

STYLE
- Be specific but concise; keep tables scannable and code blocks copy-ready.
- If context is too long to process fully, use a sliding-window summary of earlier turns to preserve traceability and still complete all sections.
```

---

## 📋 When to Use This Prompt

**Apply Prompt Forensics when:**
- ✅ You've completed a complex conversation and want to extract patterns
- ✅ You need to document what worked in a successful interaction
- ✅ You want to build a library of effective prompts
- ✅ You're analyzing dozens of threads for systematic knowledge extraction
- ✅ You need to create reusable templates from ad-hoc conversations
- ✅ You want to improve team prompt quality through examples

**Don't use when:**
- ❌ Conversation is still ongoing (wait until complete)
- ❌ Thread is very short (< 5 exchanges)
- ❌ Content is highly sensitive/private

---

## 🔧 Customization

### Optional Context Addition

Add before the prompt:
```
Context: This conversation is about {{thread_context}}.
Focus extraction on patterns relevant to this domain.
```

### Adjust Scoring Depth

For lighter analysis:
```
For each prompt, provide scores only (no detailed rationale).
```

For deeper analysis:
```
For each scored dimension, provide a 1-sentence justification.
```

---

## 📊 Output Structure

**You'll receive a comprehensive report with:**

1. **Conversation Map** - Visual flow of the dialogue
2. **Great Prompts Catalog** - High-impact prompts with scores (1-5 on 5 dimensions)
3. **Strong Links** - Causal chains that worked
4. **Super-Prompt** - Refactored reusable template
5. **Anti-Fragility Add-Ons** - Error handling patterns
6. **Missed Opportunities** - What could have been better
7. **Upgrade Table** - Before/after prompt improvements
8. **Lessons Learned** - Top 5 principles
9. **Quick Wins Library** - Copy-paste micro-prompts

---

## ✅ Quality Indicators

**Good output includes:**
- Specific message references (m1, a1, m2, etc.)
- Concrete scores with brief rationales
- Actionable micro-prompts in Missed Opportunities
- Super-Prompt with clear {{VARIABLES}}
- At least 5 lessons learned

**Red flags:**
- Vague references ("at some point...")
- All scores are 3/5 (not discriminating)
- Missed Opportunities section empty
- Lessons are generic platitudes

---

## 🔄 Post-Analysis Workflow

After receiving the insights report:

1. **Save the file** as `prompt-insights--[topic]-[date].md`
2. **Review Sections 2, 8, 9** for immediately reusable content
3. **Extract Super-Prompt** (Section 4) if it's domain-valuable
4. **Add to Arsenal catalogs**:
   - Quick Wins → Prompt Patterns Library (memory)
   - Lessons → Prompt Engineering principles (memory)
   - Super-Prompt → New prompt file (if reusable)
5. **Track metrics** in insights log

---

## 📈 Metrics to Track

For each analysis, record:
- **Thread ID/Date**
- **Domain/Context**
- **# of Prompts Extracted** (from Section 2)
- **# of Patterns Identified** (from Section 3)
- **# of Lessons Documented** (from Section 8)
- **Quality Score Range** (min-max from Section 2)
- **Arsenal Items Added** (prompts, patterns, rules created)

---

## 💡 Pro Tips

### 1. Run on Successful Threads First
High-quality conversations yield better patterns. Analyze your wins before your struggles.

### 2. Batch Process Similar Topics
Analyze 5-10 threads on the same topic (e.g., "API design") to identify domain-specific patterns.

### 3. Compare Super-Prompts
If multiple threads produce Super-Prompts, merge the best elements into one ultimate template.

### 4. Track Pattern Evolution
As you extract patterns, rate their effectiveness across multiple threads to validate.

### 5. Create Domain-Specific Variants
Customize the forensics prompt for specific domains (coding, planning, debugging) by adjusting the output sections.

---

## 🔗 Related Arsenal Items

**🔄 Workflows:**
- [Insights Extraction Pipeline](https://github.com/ChrisTansey007/ai-workflows-arsenal/blob/main/windsurf/meta-analysis/insights-extraction-pipeline.md) - Complete process for using this prompt

**💭 Memories:**
- [Prompt Patterns Library](https://github.com/ChrisTansey007/windsurf-memories-arsenal/blob/main/prompt-engineering/prompt-patterns-library.md) - Where extracted patterns go

**⚙️ Rules:**
- [Prompt Quality Standards](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/prompt-design/prompt-quality-standards.md) - Scoring framework used

**📝 Prompts:**
- [Insights Intake Processor](./insights-intake-processor.md) - Process the output of this prompt

---

## 📖 Example Usage

**Scenario:** You just finished a 25-message thread designing an email integration system.

**Step 1:** Paste the Prompt Forensics Analyzer

**Step 2:** Receive insights report with:
- 8 high-impact prompts identified
- 12 patterns extracted
- Super-Prompt for "Email Provider Configuration Generator"
- 5 lessons about OAuth debugging

**Step 3:** Add to Arsenal:
- Super-Prompt → `prompt-arsenal/development/email/`
- Patterns → `windsurf-memories-arsenal/prompt-engineering/prompt-patterns-library.md`
- Lessons → Update email integration memory

**Time:** 3 min to run, 20 min to process results

---

**Result: Systematic knowledge extraction from every valuable conversation!** 🔍
