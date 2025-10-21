---
id: prm.71eaa4e0
type: prompt
title: Prompt Insights — Forensics, Chainmining, and Upgrades
tags: []
role: user
summary: Extracted from conversation analysis - Prompt Insights — Forensics, Chainmining, and Upgrades
vars:
  - { name: brand_name, required: true, description: "Extracted from: - {BRAND_NAME} (string)" }
  - { name: industry, required: true, description: "Extracted from: - {INDUSTRY} (e.g., fencing)" }
  - { name: tone_keywords, required: true, description: "Extracted from: - {TONE_KEYWORDS} (e.g., friendly, approachable, d" }
  - { name: audience, required: true, description: "Extracted from: - {AUDIENCE} (e.g., homeowners, property managers," }
  - { name: exclusions, required: true, description: "Extracted from: - {EXCLUSIONS} (e.g., no location mentions; no SEO" }
version: 1
source_insights: prompt-insights--71eaa4e0.md
---

# Prompt Insights — Forensics, Chainmining, and Upgrades

**Extracted from conversation analysis on 2023-04-19.**

---

## 🎯 The Complete Prompt

```markdown
ROLE: Senior Content Strategist + Copy Editor for a family-owned home-services company.

OBJECTIVE: Produce a consistent, helpful writing style guide for FAQ-style blog posts.

INPUTS:
- {BRAND_NAME} (string)
- {INDUSTRY} (e.g., fencing)
- {TONE_KEYWORDS} (e.g., friendly, approachable, down-to-earth)
- {AUDIENCE} (e.g., homeowners, property managers, business owners)
- {EXCLUSIONS} (e.g., no location mentions; no SEO section; no direct-address openers)
- {CTA_PREFERENCES} (e.g., 1–2 friendly CTAs per post)
- {LEGAL_SCOPE} (e.g., general guidance only; recommend verification)
- {READING_LEVEL} (e.g., 7th–9th grade)
- {FORMAT_PREFS} (e.g., H2/H3 headers; bullets; paragraph length)

PROCESS CHECKLIST:
1) Confirm constraints from {EXCLUSIONS} and align tone to {TONE_KEYWORDS} for {AUDIENCE}.
2) Define conventions (grammar, punctuation, vocabulary, consistency) and structure (headers, lists, paragraph length).
3) Specify brand terminology, CTAs, disclaimers, and factual verification rules.
4) Provide an editing/proofing checklist and acceptance criteria.
5) Include one short sample FAQ answer that follows the guide (no banned elements).
6) Output a clean, scannable document ready for direct use.

OUTPUT:
- Title
- 1-paragraph purpose statement
- Sections: Voice & Tone; Audience & Purpose; Style Conventions; Structure & Formatting; Brand Terminology & Consistency; FAQ Tone & CTAs; Editing & Proofreading; Legal & Disclaimers
- “Acceptance Checklist” (bulleted) to validate compliance with the guide
- Optional “Sample FAQ Answer” adhering to constraints

QUALITY CHECKS:
- Verify {EXCLUSIONS} are fully honored.
- Readability at {READING_LEVEL}; paragraphs ≤ 4 sentences.
- Consistency of terminology; contractions allowed; Oxford comma used.
- CTAs match {CTA_PREFERENCES}; none beyond limit.
- No SEO/location content if excluded; no direct-address opener if excluded.
```

---

## 📋 When to Use

**Apply this prompt when:**


---

## 🔧 Prompt Structure

**Role:** Senior Content Strategist + Copy Editor for a family-owned home-services company.

**Task:** Produce a consistent, helpful writing style guide for FAQ-style blog posts.

**Inputs:**
- {BRAND_NAME} (string)
- {INDUSTRY} (e.g., fencing)
- {TONE_KEYWORDS} (e.g., friendly, approachable, down-to-earth)
- {AUDIENCE} (e.g., homeowners, property managers, business owners)
- {EXCLUSIONS} (e.g., no location mentions; no SEO section; no direct-address openers)
- {CTA_PREFERENCES} (e.g., 1–2 friendly CTAs per post)
- {LEGAL_SCOPE} (e.g., general guidance only; recommend verification)

**Process:**
1) Confirm constraints from {EXCLUSIONS} and align tone to {TONE_KEYWORDS} for {AUDIENCE}.
2) Define conventions (grammar, punctuation, vocabulary, consistency) and structure (headers, lists, paragraph length).
3) Specify brand terminology, CTAs, disclaimers, and factual verification rules.
4) Provide an editing/proofing checklist and acceptance criteria.
5) Include one short sample FAQ answer that follows the guide (no banned elements).
6) Output a clean, scannable document ready for direct use.

**Quality Checks:**
- Verify {EXCLUSIONS} are fully honored.
- Readability at {READING_LEVEL}; paragraphs ≤ 4 sentences.
- Consistency of terminology; contractions allowed; Oxford comma used.
- CTAs match {CTA_PREFERENCES}; none beyond limit.
- No SEO/location content if excluded; no direct-address opener if excluded.

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
