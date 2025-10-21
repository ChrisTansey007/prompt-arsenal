---
id: prm.canvas-3
type: prompt
title: Prompt Insights — Croquet Venture Thread
tags: []
role: user
summary: Extracted from conversation analysis - Prompt Insights — Croquet Venture Thread
vars:
  - { name: venture_name, required: true, description: "Extracted from: - {{VENTURE_NAME}} (e.g., “Croquet Supply Co.”)" }
  - { name: product_lines, required: true, description: "Extracted from: - {{PRODUCT_LINES}} (e.g., Classic/Club+/Pro; key " }
  - { name: target_regions, required: true, description: "Extracted from: - {{TARGET_REGIONS}} (e.g., USA; focus {{STATE_OR_" }
  - { name: state_or_locale, required: true, description: "Extracted from: - {{TARGET_REGIONS}} (e.g., USA; focus {{STATE_OR_" }
  - { name: pilot_venue, required: true, description: "Extracted from: - {{PILOT_VENUE}} (e.g., St. James, Southport NC)" }
version: 1
source_insights: prompt-insights--canvas-3e59bc9c.md
---

# Prompt Insights — Croquet Venture Thread

**Extracted from conversation analysis on 2023-12-25.**

---

## 🎯 The Complete Prompt

```markdown
ROLE: You are a Venture Builder + Research Analyst + Product Designer.
OBJECTIVE: Produce a club-first go-to-market, quantified model, and investor-ready assets for a niche gear venture.

INPUTS:
- {{VENTURE_NAME}} (e.g., “Croquet Supply Co.”)
- {{PRODUCT_LINES}} (e.g., Classic/Club+/Pro; key options)
- {{TARGET_REGIONS}} (e.g., USA; focus {{STATE_OR_LOCALE}})
- {{PILOT_VENUE}} (e.g., St. James, Southport NC)
- {{NETWORK_PARTNER}} (e.g., Troon Privé)
- {{BRAND_COLORS}} (e.g., USA palette)
- {{ASSUMPTION_ECON}} (sku contributions, accessory margin, fees)
- {{FIXED_COSTS_MONTHLY}}; {{UNITS_PER_MONTH}}; {{MIX}}; {{ATTACH_RATE}}
- {{CONSTRAINTS}} (e.g., conflict-of-interest guardrails, disclosure needs)

PROCESS CHECKLIST:
1) MARKET & COMPETITION — Use web browsing to verify: participation trends (pickleball vs niche), associations (USA + {{STATE_OR_LOCALE}}), and competitors (USA + {{STATE_OR_LOCALE}}) with prices/channels.
2) CLUB-FIRST PROGRAM — Define bundles, service loop, KPIs, and a pilot charter for {{PILOT_VENUE}}; sketch a rollout via {{NETWORK_PARTNER}} (phases + SLAs).
3) FINANCIAL MODEL — Build contribution math and an owner-draw calculator (units/mix/attach/fixed sliders). Export a short scenario table.
4) ARTIFACTS — (a) Interactive web page (React/Tailwind/shadcn) with charts and calculator; (b) Pitch deck; (c) Print-ready PDF; (d) Two outreach emails.
5) ETHICS/COI — Provide optional advisor/passive ownership structures and required disclosures for any insider champion.
6) QUALITY REVIEW — Cross-check figures, cite sources, and ensure printing and accessibility (alt text, readable contrasts).

OUTPUT SPEC:
- Executive Summary (club-first thesis, venue, rollout)
- Market & Associations (with citations)
- Competitor Cards (pricing/offer/channel)
- Pilot Charter (scope, KPIs, terms, timeline)
- Financials (scenario table + founder draw)
- Artifacts: links to page, deck, and PDF
- Outreach emails (venue + network partner)
- COI/Disclosure boilerplate

QUALITY CHECKS:
- Recency: cite at least 2 reputable sources dated ≤12 months for market stats.
- Math: reconcile totals; show assumptions distinctly.
- Formatting: USA palette if {{BRAND_COLORS}} == USA.
- Print: export a landscape PDF; margins ≥0.5"; font ≥11pt.
```

---

## 📋 When to Use

**Apply this prompt when:**


---

## 🔧 Prompt Structure

**Role:** You are a Venture Builder + Research Analyst + Product Designer.

**Task:** Produce a club-first go-to-market, quantified model, and investor-ready assets for a niche gear venture.

**Inputs:**
- {{VENTURE_NAME}} (e.g., “Croquet Supply Co.”)
- {{PRODUCT_LINES}} (e.g., Classic/Club+/Pro; key options)
- {{TARGET_REGIONS}} (e.g., USA; focus {{STATE_OR_LOCALE}})
- {{PILOT_VENUE}} (e.g., St. James, Southport NC)
- {{NETWORK_PARTNER}} (e.g., Troon Privé)
- {{BRAND_COLORS}} (e.g., USA palette)
- {{ASSUMPTION_ECON}} (sku contributions, accessory margin, fees)

**Process:**
1) MARKET & COMPETITION — Use web browsing to verify: participation trends (pickleball vs niche), associations (USA + {{STATE_OR_LOCALE}}), and competitors (USA + {{STATE_OR_LOCALE}}) with prices/channels.
2) CLUB-FIRST PROGRAM — Define bundles, service loop, KPIs, and a pilot charter for {{PILOT_VENUE}}; sketch a rollout via {{NETWORK_PARTNER}} (phases + SLAs).
3) FINANCIAL MODEL — Build contribution math and an owner-draw calculator (units/mix/attach/fixed sliders). Export a short scenario table.
4) ARTIFACTS — (a) Interactive web page (React/Tailwind/shadcn) with charts and calculator; (b) Pitch deck; (c) Print-ready PDF; (d) Two outreach emails.
5) ETHICS/COI — Provide optional advisor/passive ownership structures and required disclosures for any insider champion.
6) QUALITY REVIEW — Cross-check figures, cite sources, and ensure printing and accessibility (alt text, readable contrasts).

**Quality Checks:**
- Executive Summary (club-first thesis, venue, rollout)
- Market & Associations (with citations)
- Competitor Cards (pricing/offer/channel)
- Pilot Charter (scope, KPIs, terms, timeline)
- Financials (scenario table + founder draw)
- Artifacts: links to page, deck, and PDF
- Outreach emails (venue + network partner)
- COI/Disclosure boilerplate

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
