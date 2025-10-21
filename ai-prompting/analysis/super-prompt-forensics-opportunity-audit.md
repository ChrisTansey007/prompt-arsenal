---
id: prm.522
type: prompt
title: Super-Prompt Forensics & Opportunity Audit
tags: []
role: user
summary: Extracted from conversation analysis - Super-Prompt Forensics & Opportunity Audit
vars:
  []
version: 1
source_insights: prompt_insights-522.md
---

# Super-Prompt Forensics & Opportunity Audit

**Extracted from conversation analysis on 2025-07-22.**

---

## 🎯 The Complete Prompt

```markdown
You are {{ROLE}} specializing in prompt engineering and critique.
Your objective is to analyze a provided {{INPUT_DOCUMENT}} and produce:
1. **User Stories**: Identify 5 distinct stakeholder personas with “As a…, I want…, So that…” format.
2. **Critique**: For each story, evaluate how the project meets or gaps that need addressing.
3. **Feature Requests**: Consolidate and prioritize actionable improvements aligned to stories.
4. **Prioritized Checklist**: List single‑item tasks, sorted by impact.

Process Checklist:
- [ ] Read and summarize {{INPUT_DOCUMENT}} structure.
- [ ] Draft 5 user stories covering product, dev, data, DevOps, and contributors.
- [ ] Critique each story with specific feedback and suggestions.
- [ ] Combine critiques into feature requests; break into atomic items.
- [ ] Rank items by priority or importance.

Output Schema (Markdown):
- Section: User Stories & Critiques
- Section: Consolidated Feature Requests
- Section: Prioritized Single‑Item Checklist

Quality Checks:
- Verify 5 user stories are present.
- Ensure each request is independent and concrete.
- Include priority ordering.
- Self‑review for clarity, completeness, and actionability.
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ **Specify Format & Sections**: Explicitly define output sections to streamline structure.
- ✅ **Use Role/Task Templates**: “As a…, I want…, So that…” reliably yields comprehensive user stories.
- ✅ **Ask for Examples Early**: Prompting for sample outputs accelerates clarity.
- ✅ **Iterative Refinement**: Breaking large asks into consolidation and prioritization steps improves focus.
- ✅ **Provide Self-Review Rubric**: Embedding quality checks reduces omissions and misinterpretations.

---

## 🔧 Prompt Structure

**Process:**
- [ ] Read and summarize {{INPUT_DOCUMENT}} structure.
- [ ] Draft 5 user stories covering product, dev, data, DevOps, and contributors.
- [ ] Critique each story with specific feedback and suggestions.
- [ ] Combine critiques into feature requests; break into atomic items.
- [ ] Rank items by priority or importance.
- Section: User Stories & Critiques
- Section: Consolidated Feature Requests

**Quality Checks:**
- Verify 5 user stories are present.
- Ensure each request is independent and concrete.
- Include priority ordering.
- Self‑review for clarity, completeness, and actionability.

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
