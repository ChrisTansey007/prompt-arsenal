---
id: prm.add-citations
type: prompt
title: Add Citations to Support Claims - Ground Output in Real-World Sources
tags: [citations, verification, credibility, sources, validation]
role: user
summary: Enhance any output by adding 2+ verifiable citations or repository links supporting each major section - increases credibility and enables fact-checking.
vars:
  - { name: content_to_enhance, required: false, description: "The content that needs citations (leave blank to enhance previous response)" }
  - { name: source_types, required: false, default: "GitHub repos, documentation, research papers", description: "Preferred types of sources" }
merge:
  - rule.prompt-quality
version: 1
---

# Add Citations to Support Claims

**Ground AI output in verifiable real-world sources for credibility and validation.**

---

## 🎯 The Complete Prompt

```markdown
Add 2 verifiable citations or repository links supporting each section.

{{content_to_enhance}}

For each major claim or recommendation:
1. Identify authoritative sources ({{source_types}})
2. Add inline citations with links
3. Include a References section at the end
4. Verify all links are accessible

Format citations as:
- [Source Name](URL) - Brief description of relevance
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ Output makes technical claims that should be verified
- ✅ Creating documentation for public consumption
- ✅ Need to increase credibility of recommendations
- ✅ Want readers to explore sources themselves
- ✅ Building educational or tutorial content
- ✅ Refactoring AI output to add sources

**Document types that benefit:**
- Technical guides
- Best practices documentation
- Architecture decisions
- Library/framework recommendations
- Security advisories
- Performance optimization guides

---

## 🔧 Usage Examples

### Example 1: Add Citations to Previous Response

**Input:**
```markdown
Add 2 verifiable citations or repository links supporting each section.

{Use the previous response}

For each major claim or recommendation:
1. Identify authoritative sources (GitHub repos, official docs, MDN)
2. Add inline citations with links
3. Include a References section at the end
4. Verify all links are accessible
```

**Result:** Previous response enhanced with inline citations and references section.

---

### Example 2: Enhance Existing Documentation

**Input:**
```markdown
Add 2 verifiable citations or repository links supporting each section.

## React Best Practices

1. Use functional components with hooks
2. Implement proper error boundaries
3. Optimize with React.memo for expensive renders
4. Use Suspense for code splitting

For each major claim or recommendation:
1. Identify authoritative sources (GitHub repos, React docs, research papers)
2. Add inline citations with links
3. Include a References section at the end
4. Verify all links are accessible
```

**Result:** Each best practice backed by React docs, popular GitHub repos, and performance studies.

---

### Example 3: Academic-Style Citations

**Input:**
```markdown
Add 2 verifiable citations or repository links supporting each section.

{content about OAuth security}

For each major claim or recommendation:
1. Identify authoritative sources (RFCs, OWASP, security research papers)
2. Add inline citations with links
3. Include a References section at the end
4. Verify all links are accessible

Format citations as:
- [Source Name](URL) - Brief description of relevance
```

**Result:** Security claims backed by RFCs, OWASP guidelines, and security research.

---

## ✅ Quality Indicators

**Good citations include:**
- Direct links to authoritative sources
- Brief description of relevance
- Mix of official docs, repos, and research
- Accessible URLs (not behind paywalls when possible)
- Recent sources (especially for fast-moving tech)

**Red flags:**
- Generic citations that don't support specific claims
- Broken or inaccessible links
- Only one type of source (e.g., all blog posts)
- Citations without context or description
- Sources that contradict the claim

---

## 🎯 Source Type Recommendations

### For Code Patterns
**Best sources:**
- Official framework documentation
- Popular GitHub repositories with high stars
- Framework maintainer blogs
- Stack Overflow canonical questions

### For Architecture Decisions
**Best sources:**
- Architecture Decision Records (ADRs)
- System design books/papers
- Tech company engineering blogs
- Academic research papers

### For Security Claims
**Best sources:**
- RFCs and standards (IETF, W3C)
- OWASP guidelines
- CVE databases
- Security research papers

### For Performance Optimization
**Best sources:**
- Benchmark repos
- Browser vendor documentation
- Performance measurement studies
- Framework performance guides

---

## 💡 Pro Tips

### 1. Mix Source Types
Combine official docs + real-world examples + research for strongest validation.

### 2. Prefer Primary Sources
Link to original documentation rather than tutorials about it.

### 3. Check Link Stability
Prefer permalink URLs (with commit SHAs for GitHub) over branch references.

### 4. Add Context
Don't just list links - explain why each source is relevant.

### 5. Update Regularly
Check citations periodically for dead links or outdated information.

---

## 📊 Citation Formats

### Inline Citation (Preferred)
```markdown
React hooks provide better code reusability than class components 
[React Hooks Documentation](https://react.dev/reference/react).
```

### Footnote Style
```markdown
React hooks provide better code reusability than class components.[1]

---
[1] React Hooks Documentation: https://react.dev/reference/react
```

### References Section (Comprehensive)
```markdown
## References

- [React Hooks Documentation](https://react.dev/reference/react) - Official React documentation on hooks API
- [useHooks Repository](https://github.com/uidotdev/usehooks) - Collection of modern, server-safe React hooks
- [Hooks Performance Study](https://example.com/study) - Comparative analysis of hooks vs classes
```

---

## 🔄 Workflow Integration

### During Content Creation
Use inline as you write:
```markdown
"Use async/await for cleaner async code [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function)"
```

### After Content Creation
Run this prompt to enhance completed content with sources.

### During Review
Check all citations are valid, relevant, and accessible.

---

## 🎓 Citation Quality Checklist

**Before adding citation:**
- [ ] Source is authoritative in the domain
- [ ] Link is accessible (no paywall if possible)
- [ ] Content directly supports the claim
- [ ] Link includes context/description
- [ ] URL is stable (not temporary)

**After adding citations:**
- [ ] Each major section has 2+ citations
- [ ] Mix of source types used
- [ ] All links tested and working
- [ ] References section formatted consistently
- [ ] Citations match citation style throughout

---

## 🔗 Related Arsenal Items

**📝 Prompts:**
- [Structured Document Architect](./structured-document-architect.md) - Creates docs with built-in citation support
- [Self-Score Output Quality](./self-score-output.md) - Includes citation quality in scoring

**💭 Memories:**
- [Prompt Patterns Library](https://github.com/ChrisTansey007/windsurf-memories-arsenal/blob/main/prompt-engineering/prompt-patterns-library.md) - Citation pattern (5/5 effectiveness)

**⚙️ Rules:**
- [Prompt Quality Standards](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/prompt-design/prompt-quality-standards.md) - Tool/resource use dimension

---

## 📖 Source

**Extracted from:** prompt-insights--0724c73c.md (2025-10-20)  
**Original pattern:** "Add 2 verifiable citations or repository links supporting each section."  
**Effectiveness:** 5/5 - Consistently elevates credibility  
**Validation:** Used successfully in agents.md creation

---

## 🌟 Impact

**Before this prompt:**
```markdown
Use React hooks for better code reusability.
```

**After this prompt:**
```markdown
Use React hooks for better code reusability [React Hooks Documentation](https://react.dev/reference/react), 
as demonstrated in popular libraries like [useHooks](https://github.com/uidotdev/usehooks) 
which has 10k+ stars.
```

**Result:** Claims are now verifiable, credible, and explorable! 🔗
