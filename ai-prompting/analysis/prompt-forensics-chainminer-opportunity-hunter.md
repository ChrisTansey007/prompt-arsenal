---
id: prm.20251020
type: prompt
title: Prompt Forensics • Chainminer • Opportunity Hunter Report
tags: []
role: user
summary: Extracted from conversation analysis - Prompt Forensics • Chainminer • Opportunity Hunter Report
vars:
  - { name: datasets, required: true, description: "Extracted from: - {DATASETS}: e.g., ACS renter/owner %, rent burde" }
  - { name: geographies, required: false, description: "Extracted from: - {GEOGRAPHIES}: state/county/place/tract (and opt" }
  - { name: features, required: true, description: "Extracted from: - {FEATURES}: e.g., Trends, Compare + Map, Bivaria" }
  - { name: branding, required: true, description: "Extracted from: - {BRANDING}: app name, color constraints, accessi" }
  - { name: delivery_mode, required: true, description: "Extracted from: - {DELIVERY_MODE}: zip artifacts, run instructions" }
version: 1
source_insights: prompt-insights-20251020-205339.md
---

# Prompt Forensics • Chainminer • Opportunity Hunter Report

**Extracted from conversation analysis on 2024-08-31.**

---

## 🎯 The Complete Prompt

```markdown
```md
ROLE: Senior Data Product Engineer + UX Strategist

TASK: Build and ship a data-to-visualization web app for rental vs. ownership analysis with fast discovery, trustworthy uncertainty handling, and exportable, reproducible outputs.

OBJECTIVE: Deliver a working FastAPI + Next.js app with bivariate maps, comparisons, trends, exports, saved views, and onboarding, optimized for modernness, intuitiveness, and explainability.

INPUTS:
- {DATASETS}: e.g., ACS renter/owner %, rent burden, Zillow ZORI/ZHVI; include vintages.
- {GEOGRAPHIES}: state/county/place/tract (and optional neighborhood sets).
- {FEATURES}: e.g., Trends, Compare + Map, Bivariate, Recipes, Explain Drawer, Boundaries upload, Saved views, Command palette, Web Share, Exports.
- {BRANDING}: app name, color constraints, accessibility requirements (WCAG target).
- {DELIVERY_MODE}: zip artifacts, run instructions, environment variables.

PROCESS CHECKLIST:
1) **Plan & Scaffold**: Outline architecture (FastAPI, endpoints; Next.js routes/components), env strategy, and data contracts. Create runnable scaffolds.
2) **Core Features**: Implement Bivariate (with thresholds + hatching), Compare (bars + table), Trends (benchmarks), Story Kit exports (PNG/SVG/CSV + README caption/alt).
3) **Modern UX**: Add Web Share, command palette (actions: exports, save view), keyboard cheatsheet, skeleton loading, and touch-friendly controls.
4) **Guidance & Trust**: Add Insight Recipes (click-to-apply presets) and an Explain Drawer (CV/MOE basics, CI cautions). Watermark and footers on exports.
5) **Collaboration & Boundaries**: Implement /views/save + public retrieval; add Boundaries upload (GeoJSON) and synthetic or real aggregation endpoint.
6) **Onboarding & Metrics**: Add first-run tour; instrument events (TTFI, exports, saved view rate); include a Methods page link and a Saved Views gallery.

OUTPUT SPEC:
- **Artifacts**: two zips (FastAPI project; Next.js project), run steps, .env examples.
- **Endpoints**: `/bivariate/geojson`, `/trends/compare`, `/stats`, `/export/storykit`, `/views/save`, `/views/public/{id}`, `/boundaries/*`, `/events`.
- **UI Routes**: `/bivariate`, `/compare-map`, `/trends`, `/boundaries`, `/saved` (gallery).
- **A11y**: patterned uncertainty, focus states, SR announcements for selection changes.
- **Docs**: README with quickstart, feature list, and data freshness notes.

QUALITY CHECKS (RUBRIC):
- **Completeness**: All listed routes + endpoints work with sample data.
- **UX Speed**: TTFI < 90s; exports within 1s on sample data.
- **Trust**: Hatching for high-CV/no-data; captions/alt in exports; watermark & permalink.
- **Reproducibility**: Saved views roundtrip via public URL; command palette actions present.
- **A11y**: Color-safe palette + patterns; keyboard path validated; ARIA live regions used.
- **Docs**: Run instructions and env usage are accurate and tested.
```
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ **Explicit delivery prompts** (“ship two zips”) outperform vague approvals—clear targets create artifacts.
- ✅ **Approve-then-ship cadence** (critique → “yes do that”) accelerates iteration while keeping scope aligned.
- ✅ **Modern UX features** (Web Share, command palette, hatching) materially improve usability and trust with minimal backend lift.
- ✅ **Guided discovery** (Recipes + Explain Drawer) shortens time-to-first-insight and reduces misinterpretation risk.
- ✅ **Light instrumentation** (events, TTFI) is easy to add and crucial for validating UX improvements.

---

## 🔧 Prompt Structure

**Role:** Senior Data Product Engineer + UX Strategist

**Task:** Build and ship a data-to-visualization web app for rental vs. ownership analysis with fast discovery, trustworthy uncertainty handling, and exportable, reproducible outputs.

**Inputs:**
- {DATASETS}: e.g., ACS renter/owner %, rent burden, Zillow ZORI/ZHVI; include vintages.
- {GEOGRAPHIES}: state/county/place/tract (and optional neighborhood sets).
- {FEATURES}: e.g., Trends, Compare + Map, Bivariate, Recipes, Explain Drawer, Boundaries upload, Saved views, Command palette, Web Share, Exports.
- {BRANDING}: app name, color constraints, accessibility requirements (WCAG target).
- {DELIVERY_MODE}: zip artifacts, run instructions, environment variables.

**Process:**
1) **Plan & Scaffold**: Outline architecture (FastAPI, endpoints; Next.js routes/components), env strategy, and data contracts. Create runnable scaffolds.
2) **Core Features**: Implement Bivariate (with thresholds + hatching), Compare (bars + table), Trends (benchmarks), Story Kit exports (PNG/SVG/CSV + README caption/alt).
3) **Modern UX**: Add Web Share, command palette (actions: exports, save view), keyboard cheatsheet, skeleton loading, and touch-friendly controls.
4) **Guidance & Trust**: Add Insight Recipes (click-to-apply presets) and an Explain Drawer (CV/MOE basics, CI cautions). Watermark and footers on exports.
5) **Collaboration & Boundaries**: Implement /views/save + public retrieval; add Boundaries upload (GeoJSON) and synthetic or real aggregation endpoint.
6) **Onboarding & Metrics**: Add first-run tour; instrument events (TTFI, exports, saved view rate); include a Methods page link and a Saved Views gallery.

**Quality Checks:**
- **Completeness**: All listed routes + endpoints work with sample data.
- **UX Speed**: TTFI < 90s; exports within 1s on sample data.
- **Trust**: Hatching for high-CV/no-data; captions/alt in exports; watermark & permalink.
- **Reproducibility**: Saved views roundtrip via public URL; command palette actions present.
- **A11y**: Color-safe palette + patterns; keyboard path validated; ARIA live regions used.
- **Docs**: Run instructions and env usage are accurate and tested.

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
