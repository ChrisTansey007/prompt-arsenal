---
id: prm.5a4f6c25
type: prompt
title: Prompt Insights: SEO FAQ Ranking Thread
tags: []
role: user
summary: Extracted from conversation analysis - Prompt Insights: SEO FAQ Ranking Thread
vars:
  - { name: faq_list, required: true, description: "Extracted from: - {{FAQ_LIST}}  # list of questions + any notes/co" }
  - { name: business_profile, required: true, description: "Extracted from: - {{BUSINESS_PROFILE}}  # brand, services, locatio" }
  - { name: market_notes, required: false, description: "Extracted from: - {{MARKET_NOTES}}  # competitors, SERP intent obs" }
  - { name: rating_axes, required: true, description: "Extracted from: - {{RATING_AXES}} = ["Relevance","Engagement","Con" }
  - { name: output_count, required: true, description: "Extracted from: - {{OUTPUT_COUNT}}  # how many to return (e.g., al" }
version: 1
source_insights: prompt-insights--5a4f6c25.md
---

# Prompt Insights: SEO FAQ Ranking Thread

**Extracted from conversation analysis on 2023-02-28.**

---

## 🎯 The Complete Prompt

```markdown
ROLE: You are an SEO strategist and content architect.

OBJECTIVE: Rank a set of FAQs from best→worst for SEO impact and produce decision-ready outputs.

INPUTS:
- {{FAQ_LIST}}  # list of questions + any notes/content
- {{BUSINESS_PROFILE}}  # brand, services, locations, audiences, constraints
- {{MARKET_NOTES}}  # competitors, SERP intent observations (optional)
- {{RATING_AXES}} = ["Relevance","Engagement","Conversion"]  # override allowed
- {{OUTPUT_COUNT}}  # how many to return (e.g., all, top 30)
- {{LOCALITY}}  # location modifiers (e.g., Wilmington, NC)

PROCESS CHECKLIST:
1) Normalize and de-duplicate FAQs; merge near-duplicates; flag contradictions.
2) Define scoring rubric for each axis (1–5 scale, anchored definitions).
3) Score each FAQ; justify ordering with 1–2 sentences; add 2 pros & 2 cons.
4) Map each FAQ to **dominant search intent** (Informational/Commercial/Transactional/Local).
5) Recommend internal links (site sections) and schema opportunities (FAQPage JSON‑LD).
6) Output results in **Markdown table + CSV + JSON-LD**; include a brief summary of patterns.

OUTPUT SPEC:
- Section A: Executive summary (top insights + ordering rationale).
- Section B: Ranked table with columns: Rank | FAQ | Pros (2) | Cons (2) | Ratings (R/E/C) | Intent | Internal Link | Notes.
- Section C: CSV export (same columns).
- Section D: FAQPage JSON‑LD (top {{OUTPUT_COUNT}} items), valid per schema.org.
- Section E: Risk & Conflict flags (e.g., financing policy inconsistencies).

QUALITY CHECKS:
- Validate counts (exactly {{OUTPUT_COUNT}} items). 
- No duplicates; highlight any policy contradictions.
- Ratings use anchored rubric; include location modifiers where relevant.
- Keep quotes ≤25 words if quoting the source content.
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ A tight, repeatable schema (ratings + pros/cons) speeds delivery and improves consistency.
- ✅ Continuation prompts should **specify exact counts/ranges** to avoid partial completion.
- ✅ Local SEO and intent mapping are easy wins often missed in FAQ work.
- ✅ Contradictions in the source (e.g., financing) should be resolved **before publishing**.
- ✅ Tables + CSV/JSON exports make outputs reusable across CMS/analytics.

---

## 🔧 Prompt Structure

**Role:** You are an SEO strategist and content architect.

**Task:** Rank a set of FAQs from best→worst for SEO impact and produce decision-ready outputs.

**Inputs:**
- {{FAQ_LIST}}  # list of questions + any notes/content
- {{BUSINESS_PROFILE}}  # brand, services, locations, audiences, constraints
- {{MARKET_NOTES}}  # competitors, SERP intent observations (optional)
- {{RATING_AXES}} = ["Relevance","Engagement","Conversion"]  # override allowed
- {{OUTPUT_COUNT}}  # how many to return (e.g., all, top 30)
- {{LOCALITY}}  # location modifiers (e.g., Wilmington, NC)

**Process:**
1) Normalize and de-duplicate FAQs; merge near-duplicates; flag contradictions.
2) Define scoring rubric for each axis (1–5 scale, anchored definitions).
3) Score each FAQ; justify ordering with 1–2 sentences; add 2 pros & 2 cons.
4) Map each FAQ to **dominant search intent** (Informational/Commercial/Transactional/Local).
5) Recommend internal links (site sections) and schema opportunities (FAQPage JSON‑LD).
6) Output results in **Markdown table + CSV + JSON-LD**; include a brief summary of patterns.

**Quality Checks:**
- Validate counts (exactly {{OUTPUT_COUNT}} items).
- No duplicates; highlight any policy contradictions.
- Ratings use anchored rubric; include location modifiers where relevant.
- Keep quotes ≤25 words if quoting the source content.

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
