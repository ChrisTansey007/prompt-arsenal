---
id: prm.doc-architect
type: prompt
title: Structured Document Architect - Create or Evaluate Technical Documents
tags: [documentation, architecture, templates, standards, citations]
role: user
summary: Create or evaluate technical documents (agents.md, README, API specs) with structured sections, real-world grounding, and quality validation - extracted from conversation analysis.
vars:
  - { name: document_type, required: true, description: "Type of document (e.g., 'agents.md', 'README', 'API spec', 'architecture doc')" }
  - { name: context, required: false, description: "Context or prior draft to work from" }
  - { name: domain, required: false, description: "Domain or use-case (e.g., 'email integration', 'API design')" }
  - { name: depth, required: false, default: "detailed", description: "Depth level: 'outline', 'detailed', or 'production-ready'" }
  - { name: validation_level, required: false, default: "examples", description: "Source validation: 'none', 'examples', or 'citations'" }
merge:
  - rule.email-docs-standards
modelHints: { temperature: 0.3 }
version: 1
---

# Structured Document Architect

**Create or evaluate technical documents with clarity, completeness, and real-world grounding.**

---

## 🎯 The Complete Prompt

```markdown
You are an **Analyst-Architect** skilled in structured document design.

**Objective:** Create or evaluate a {{document_type}} that balances clarity, completeness, and real-world grounding.

**Inputs:**
- Context or prior draft: {{context}}
- Domain or use-case: {{domain}}
- Depth level: {{depth}} (outline / detailed / production-ready)
- Source validation preference: {{validation_level}} (none / examples / citations)

**Process Checklist:**
1. Parse intent and classify target file type.  
2. Retrieve common industry patterns or standards.  
3. Draft structured sections with headings and rationale.  
4. Include real-world citations or exemplars when requested.  
5. Self-review against clarity, completeness, and factual grounding.  

**Output Format:**
- Title and Purpose
- Structured Headings with descriptions
- Example Snippets or Templates
- (Optional) Citations Section

**Quality Checks:**
- Clarity ≥4/5
- Specificity ≥4/5
- Factual/Cited Support when validation_level ≠ "none"
- Internal consistency between overview and sections
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ Creating technical documentation from scratch
- ✅ Standardizing document structure across a project
- ✅ Evaluating existing documentation for completeness
- ✅ Need real-world examples or citations
- ✅ Designing templates for recurring document types
- ✅ Ensuring documentation meets quality standards

**Document types this works well for:**
- `agents.md` files (AI agent configurations)
- `README.md` files
- API specifications
- Architecture decision records (ADRs)
- System design documents
- Contributing guidelines
- Technical RFCs

---

## 🔧 Usage Examples

### Example 1: Create agents.md Template

**Input:**
```markdown
You are an **Analyst-Architect** skilled in structured document design.

**Objective:** Create or evaluate a agents.md that balances clarity, completeness, and real-world grounding.

**Inputs:**
- Context or prior draft: None (creating from scratch)
- Domain or use-case: AI coding assistants
- Depth level: production-ready
- Source validation preference: citations

{Continue with Process Checklist...}
```

**Output:** Complete agents.md template with sections, real-world examples, and citations to actual projects.

---

### Example 2: Evaluate Existing README

**Input:**
```markdown
You are an **Analyst-Architect** skilled in structured document design.

**Objective:** Create or evaluate a README.md that balances clarity, completeness, and real-world grounding.

**Inputs:**
- Context or prior draft: {paste existing README}
- Domain or use-case: Open source JavaScript library
- Depth level: detailed
- Source validation preference: examples

{Continue with Process Checklist...}
```

**Output:** Analysis of gaps, suggestions for improvement, examples from similar projects.

---

### Example 3: Create API Specification Outline

**Input:**
```markdown
You are an **Analyst-Architect** skilled in structured document design.

**Objective:** Create or evaluate a API specification that balances clarity, completeness, and real-world grounding.

**Inputs:**
- Context or prior draft: RESTful API for user management
- Domain or use-case: SaaS authentication system
- Depth level: outline
- Source validation preference: none

{Continue with Process Checklist...}
```

**Output:** Structured outline with sections for endpoints, authentication, rate limits, error codes, etc.

---

## ✅ Quality Indicators

**Good output includes:**
- Clear section hierarchy
- Rationale for each section
- Concrete examples (when validation_level includes them)
- Citations to reputable sources (when requested)
- Consistency across sections
- Self-review scores ≥4/5

**Red flags:**
- Generic content without domain specificity
- Missing standard sections for document type
- No examples when validation_level = "examples"
- Inconsistency between overview and detail sections
- Quality scores < 4/5

---

## 🎯 Customization Options

### Adjust Depth Level

**Outline:** High-level structure only
```
Depth level: outline
```

**Detailed:** Full content with examples
```
Depth level: detailed
```

**Production-ready:** Complete, polished, ready to publish
```
Depth level: production-ready
```

### Adjust Validation Level

**No validation:** Faster, generic
```
Source validation preference: none
```

**Examples:** Include real-world patterns
```
Source validation preference: examples
```

**Citations:** Full references to sources
```
Source validation preference: citations
```

---

## 💡 Pro Tips

### 1. Start with Outline, Then Expand
First pass: `depth: outline` to get structure  
Second pass: `depth: detailed` to fill in content  
Final pass: `depth: production-ready` for polish

### 2. Use Domain for Better Results
Specific domain = better industry patterns:
- "Open source Python library"
- "Enterprise SaaS API"
- "Mobile app documentation"

### 3. Request Citations for Credibility
For public-facing docs, use `validation_level: citations` to ground recommendations.

### 4. Provide Context for Evaluation
When evaluating existing docs, paste the full content for better analysis.

### 5. Iterate on Sections
If one section needs work, re-run with just that section as context and `depth: production-ready`.

---

## 📊 Quality Scoring

This prompt includes built-in quality checks:

**Clarity (4-5/5):**
- Unambiguous language
- Clear section purposes
- Logical flow

**Specificity (4-5/5):**
- Domain-appropriate content
- Concrete examples
- Actionable guidance

**Factual Grounding:**
- Examples from real projects
- Citations to standards/best practices
- Industry-accepted patterns

**Internal Consistency:**
- Overview matches detail
- No contradictions
- Unified terminology

---

## 🔗 Related Arsenal Items

**⚙️ Rules:**
- [Email Setup Documentation Standards](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/documentation/email-setup-docs.md) - Specific documentation patterns

**💭 Memories:**
- [Prompt Patterns Library](https://github.com/ChrisTansey007/windsurf-memories-arsenal/blob/main/prompt-engineering/prompt-patterns-library.md) - Related patterns

**📝 Prompts:**
- [Add Citations to Support Claims](./add-citations-to-output.md) - Enhance with sources
- [Self-Score Output Quality](./self-score-output.md) - Evaluate results
- [Extract Reusable Template](./extract-reusable-template.md) - Create templates from content

---

## 📖 Source

**Extracted from:** prompt-insights--0724c73c.md (2025-10-20)  
**Original thread:** agents.md structure discussion  
**Quality score:** 5/5 across all dimensions  
**Validation:** Proven effective in creating structured documentation

---

**Result: Professional documentation with industry-standard structure and real-world grounding!** 📚
