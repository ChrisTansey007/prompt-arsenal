---
id: prm.self-score
type: prompt
title: Self-Score Output Quality - AI Quality Assurance Check
tags: [quality-assurance, evaluation, scoring, self-review, validation]
role: user
summary: Request AI to score its own output on clarity, specificity, and constraint adherence (1-5 scale) - triggers self-review mechanism and surfaces quality issues before finalization.
vars:
  - { name: dimensions, required: false, default: "clarity, specificity, constraint adherence", description: "Dimensions to score on" }
  - { name: threshold, required: false, default: "4", description: "Minimum acceptable score (1-5)" }
merge:
  - rule.prompt-quality
version: 1
---

# Self-Score Output Quality

**Trigger AI self-review to catch quality issues before finalization.**

---

## 🎯 The Complete Prompt

```markdown
Score your draft for {{dimensions}} (1–5 scale).

For each dimension:
- Provide score with brief justification
- Note any areas below {{threshold}}/5
- Suggest specific improvements if score < {{threshold}}

If any dimension scores < {{threshold}}/5, revise that aspect before proceeding.
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ Output will be public-facing or critical
- ✅ You want quality assurance before finalizing
- ✅ Detecting potential issues early
- ✅ Teaching AI your quality standards
- ✅ Need objective assessment of output
- ✅ Want to improve consistency

**Output types that benefit:**
- Code implementations
- Documentation
- API specifications
- Technical proposals
- Educational content
- Production-ready artifacts

---

## 🔧 Usage Examples

### Example 1: Standard Quality Check

**Input:**
```markdown
Score your draft for clarity, specificity, and constraint adherence (1–5 scale).

For each dimension:
- Provide score with brief justification
- Note any areas below 4/5
- Suggest specific improvements if score < 4

If any dimension scores < 4/5, revise that aspect before proceeding.
```

**Result:** AI evaluates its output, identifies weak areas, and self-corrects.

---

### Example 2: Code Quality Scoring

**Input:**
```markdown
Score your code for readability, maintainability, and error handling (1–5 scale).

For each dimension:
- Provide score with brief justification
- Note any areas below 4/5
- Suggest specific improvements if score < 4

If any dimension scores < 4/5, revise that aspect before proceeding.
```

**Result:** Code review with specific improvement suggestions.

---

### Example 3: Documentation Scoring

**Input:**
```markdown
Score your documentation for completeness, accuracy, and accessibility (1–5 scale).

For each dimension:
- Provide score with brief justification
- Note any areas below 4/5
- Suggest specific improvements if score < 4

If any dimension scores < 4/5, revise that aspect before proceeding.
```

**Result:** Documentation gaps identified and addressed.

---

### Example 4: Custom Dimensions

**Input:**
```markdown
Score your API design for RESTful compliance, security, and scalability (1–5 scale).

For each dimension:
- Provide score with brief justification
- Note any areas below 4/5
- Suggest specific improvements if score < 4

If any dimension scores < 4/5, revise that aspect before proceeding.
```

**Result:** Domain-specific quality assessment.

---

## ✅ Quality Scoring Scale

### 5/5 - Excellent
- Exceeds expectations
- No improvements needed
- Ready for production

### 4/5 - Good
- Meets expectations
- Minor improvements possible
- Acceptable for use

### 3/5 - Acceptable
- Meets basic requirements
- Several improvements recommended
- Needs refinement

### 2/5 - Poor
- Falls short of expectations
- Major issues present
- Requires significant rework

### 1/5 - Inadequate
- Does not meet requirements
- Critical issues
- Complete rework needed

---

## 🎯 Common Dimensions to Score

### General Quality
- **Clarity:** How easy to understand?
- **Specificity:** How precise and targeted?
- **Completeness:** Are all requirements met?
- **Consistency:** Internal coherence?

### Code Quality
- **Readability:** Easy to read and understand?
- **Maintainability:** Easy to modify and extend?
- **Error Handling:** Robust error management?
- **Performance:** Efficient implementation?
- **Security:** Secure by design?

### Documentation Quality
- **Completeness:** All topics covered?
- **Accuracy:** Factually correct?
- **Clarity:** Easy to follow?
- **Accessibility:** Inclusive and usable?
- **Examples:** Sufficient illustrations?

### Prompt Quality (Meta)
- **Clarity:** Unambiguous instructions?
- **Specificity:** Precise requirements?
- **Constraints:** Output format defined?
- **Tools:** Resources leveraged?
- **Outcome:** Likely to succeed?

---

## 💡 Pro Tips

### 1. Set Clear Thresholds
Define minimum acceptable scores upfront (usually 4/5).

### 2. Use Domain-Specific Dimensions
Tailor scoring criteria to the type of output.

### 3. Request Justifications
Brief explanations help understand the scores.

### 4. Trigger Auto-Improvement
Add: "If score < 4, revise before proceeding"

### 5. Compare Before/After
Score, improve, score again to validate.

---

## 🔄 Workflow Integration

### Before Finalizing
```markdown
Score your output before I review it.
{standard scoring prompt}
```

### During Iteration
```markdown
Score the improvements compared to the previous version.
{scoring prompt with comparison}
```

### After Feedback
```markdown
Score the revised version addressing my feedback.
{scoring prompt}
```

---

## 📊 Example Scoring Output

**Good Self-Assessment:**
```markdown
**Clarity:** 5/5
Clear, unambiguous language throughout. Technical terms defined.

**Specificity:** 4/5
Specific requirements met. Could add one more concrete example in section 3.

**Constraint Adherence:** 5/5
All format requirements followed. Markdown properly structured.

**Overall:** 14/15 - Ready to proceed with minor enhancement to section 3.
```

**Poor Self-Assessment (Red Flag):**
```markdown
**Clarity:** 3/5
Some areas are vague.

**Specificity:** 3/5
Could be more specific.

**Constraint Adherence:** 3/5
Mostly follows format.

**Overall:** 9/15 - Needs improvement.
```
^^ This should trigger revision!

---

## 🎓 Self-Scoring Checklist

**For AI to provide useful scores:**
- [ ] Each dimension has a score (X/5)
- [ ] Each score has brief justification
- [ ] Scores are differentiated (not all 3/5 or 5/5)
- [ ] Specific issues identified for scores < 4
- [ ] Improvement suggestions provided
- [ ] Auto-revision triggered if threshold not met

**Red flags in scoring:**
- All dimensions score the same (3/3/3 or 5/5/5)
- No justifications provided
- Vague issues ("could be better")
- No specific improvements suggested
- Threshold violations ignored

---

## 🔗 Related Arsenal Items

**📝 Prompts:**
- [Add Citations to Output](../development/documentation/add-citations-to-output.md) - Improve Tool/Resource dimension
- [Extract Reusable Template](../development/documentation/extract-reusable-template.md) - Structure improvement

**💭 Memories:**
- [Prompt Patterns Library](https://github.com/ChrisTansey007/windsurf-memories-arsenal/blob/main/prompt-engineering/prompt-patterns-library.md) - Self-scoring pattern (4/5 effectiveness)

**⚙️ Rules:**
- [Prompt Quality Standards](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/prompt-design/prompt-quality-standards.md) - Full 5-D quality framework

---

## 📖 Source

**Extracted from:** prompt-insights--0724c73c.md (2025-10-20)  
**Original pattern:** "Score your draft for clarity, specificity, and constraint adherence (1–5 scale)."  
**Effectiveness:** 4/5 - Triggers useful self-review  
**Validation:** Catches quality issues before user review

---

## 🌟 Impact

**Without self-scoring:**
AI produces output → User finds issues → Back to AI for fixes

**With self-scoring:**
AI produces output → AI self-reviews → AI fixes issues → User reviews cleaner output

**Result:** Fewer iterations, higher quality, faster completion! ⭐
