---
id: prm.extract-template
type: prompt
title: Extract Reusable Template - Transform Specific into General
tags: [templates, reusability, abstraction, standardization, pattern-extraction]
role: user
summary: Condense specific responses into standardized reusable templates with variables - transforms one-time solutions into repeatable patterns for future use.
vars:
  - { name: content_to_template, required: false, description: "Specific content to transform (leave blank for previous response)" }
  - { name: variable_style, required: false, default: "{{VARIABLE}}", description: "Variable format: {{VAR}}, {VAR}, or [VAR]" }
merge:
  - mem.prompt-patterns
version: 1
---

# Extract Reusable Template

**Transform specific solutions into general, reusable templates.**

---

## 🎯 The Complete Prompt

```markdown
Condense the prior response into a standardized reusable template.

{{content_to_template}}

Process:
1. Identify specific values that should be variables
2. Replace specifics with {{variable_style}} placeholders
3. Add variable definitions section
4. Include usage instructions
5. Provide 2-3 example instantiations

Output format:
- Template with variables
- Variable definitions (name, type, description, default if any)
- Usage instructions
- Examples with filled variables
```

---

## 📋 When to Use

**Apply this prompt when:**
- ✅ AI produced a great solution you want to reuse
- ✅ Building a library of standard patterns
- ✅ Documenting best practices
- ✅ Creating team templates
- ✅ Establishing project conventions
- ✅ Want to generalize a specific example

**Content types that benefit:**
- Code implementations
- Configuration files
- Document structures
- Workflow procedures
- API specifications
- Testing patterns

---

## 🔧 Usage Examples

### Example 1: Extract Code Template

**Input:**
```markdown
Condense the prior response into a standardized reusable template.

{Previous response was: FastAPI endpoint for user creation with Pydantic validation}

Process:
1. Identify specific values that should be variables
2. Replace specifics with {{VARIABLE}} placeholders
3. Add variable definitions section
4. Include usage instructions
5. Provide 2-3 example instantiations
```

**Result:** Generic FastAPI CRUD template with {{ENTITY}}, {{FIELDS}}, {{VALIDATION}} variables.

---

### Example 2: Extract Document Template

**Input:**
```markdown
Condense the prior response into a standardized reusable template.

{Previous response was: Complete README.md for a Python library}

Process:
1. Identify specific values that should be variables
2. Replace specifics with {{VARIABLE}} placeholders
3. Add variable definitions section
4. Include usage instructions
5. Provide 2-3 example instantiations
```

**Result:** README template with {{PROJECT_NAME}}, {{DESCRIPTION}}, {{FEATURES}} variables.

---

### Example 3: Extract Workflow Template

**Input:**
```markdown
Condense the prior response into a standardized reusable template.

{Previous response was: Git workflow for feature development}

Process:
1. Identify specific values that should be variables
2. Replace specifics with {{VARIABLE}} placeholders
3. Add variable definitions section
4. Include usage instructions
5. Provide 2-3 example instantiations
```

**Result:** Git workflow template with {{BRANCH_NAME}}, {{FEATURE}}, {{BASE_BRANCH}} variables.

---

## ✅ Quality Template Indicators

**Good templates include:**
- Clear variable placeholders ({{VAR}} format)
- Complete variable definitions
- Type information for variables
- Default values where appropriate
- Multiple concrete examples
- Usage instructions

**Red flags:**
- Too many variables (over-generalized)
- Variables without definitions
- No examples provided
- Unclear when to use template
- Missing default values for optional vars

---

## 🎯 Variable Identification

### What Should Be Variables?

**YES - Make these variables:**
- Names (user, project, entity)
- Paths (directories, URLs)
- Configuration values
- Domain-specific terms
- Numeric thresholds
- Format preferences

**NO - Keep these static:**
- Best practices
- Standard patterns
- Common conventions
- Framework requirements
- Security necessities

### Variable Naming Conventions

**Good variable names:**
- `{{PROJECT_NAME}}` - Clear, descriptive
- `{{BASE_URL}}` - Standard format
- `{{MIN_LENGTH}}` - Purpose obvious

**Poor variable names:**
- `{{X}}` - Too vague
- `{{thing}}` - Not descriptive
- `{{var1}}` - No meaning

---

## 💡 Pro Tips

### 1. Start Broad, Then Specialize
Create general template first, then domain-specific variants.

### 2. Include Variable Constraints
```markdown
{{PORT}} - integer, range 1024-65535, default: 8000
```

### 3. Provide Rich Examples
Show 2-3 real-world instantiations with different variable values.

### 4. Document Assumptions
Note what the template assumes (framework version, env, etc.).

### 5. Test Templates
Verify examples actually work as shown.

---

## 📊 Template Structure

### Complete Template Format

```markdown
# Template: {{TEMPLATE_NAME}}

## Description
{What this template does and when to use it}

## Variables

| Variable | Type | Description | Default | Required |
|----------|------|-------------|---------|----------|
| {{VAR1}} | string | {description} | {default} | Yes |
| {{VAR2}} | number | {description} | {default} | No |

## Template

```{language}
{template code with {{VARIABLES}}}
```

## Usage Instructions

1. Copy template
2. Replace {{VARIABLES}} with your values
3. {Additional steps}

## Examples

### Example 1: {Scenario}
```{language}
{template with filled variables}
```

### Example 2: {Different Scenario}
```{language}
{template with different variable values}
```

## Notes
- {Important considerations}
- {Common pitfalls}
```

---

## 🔄 Workflow Integration

### After Successful Solution
```
1. AI solves problem
2. Solution works
3. Extract template for future use
4. Add to team library
```

### Building Pattern Library
```
1. Collect 5-10 solutions in one domain
2. Extract common template
3. Validate with all examples
4. Document as standard pattern
```

### Establishing Standards
```
1. Team discusses best approach
2. AI implements example
3. Extract as standard template
4. All future work uses template
```

---

## 🎓 Template Extraction Checklist

**Before extracting:**
- [ ] Original solution is high-quality
- [ ] Solution has been validated/tested
- [ ] Use case is repeatable
- [ ] Pattern applies to multiple scenarios

**During extraction:**
- [ ] All specifics identified
- [ ] Appropriate variables created
- [ ] Variable names are clear
- [ ] Defaults provided where sensible
- [ ] Usage instructions complete

**After extraction:**
- [ ] Examples actually work
- [ ] Documentation is clear
- [ ] Team can use independently
- [ ] Template is versioned

---

## 🌟 Template Types

### Code Templates
```typescript
// Template: {{ENTITY}} CRUD Endpoint
router.post('/{{ENTITY_PLURAL}}', async (req, res) => {
  // {{VALIDATION_LOGIC}}
  const {{ENTITY_VAR}} = await create{{ENTITY}}(req.body);
  res.status(201).json({{ENTITY_VAR}});
});
```

### Document Templates
```markdown
# {{PROJECT_NAME}}

## Overview
{{DESCRIPTION}}

## Features
{{FEATURE_LIST}}

## Installation
```bash
{{INSTALL_COMMAND}}
```
```

### Configuration Templates
```yaml
# {{SERVICE_NAME}} Configuration
server:
  port: {{PORT}}
  host: {{HOST}}
database:
  url: {{DATABASE_URL}}
```

### Workflow Templates
```bash
# Template: Feature Branch Workflow
git checkout -b feature/{{FEATURE_NAME}}
# ... implement {{FEATURE_NAME}}
git commit -m "feat: add {{FEATURE_NAME}}"
git push origin feature/{{FEATURE_NAME}}
```

---

## 🔗 Related Arsenal Items

**📝 Prompts:**
- [Structured Document Architect](./structured-document-architect.md) - Creates structured content for templating
- [Self-Score Output Quality](../../quality-assurance/self-score-output.md) - Validate templates before saving

**💭 Memories:**
- [Prompt Patterns Library](https://github.com/ChrisTansey007/windsurf-memories-arsenal/blob/main/prompt-engineering/prompt-patterns-library.md) - Template extraction pattern (5/5 effectiveness)

**⚙️ Rules:**
- [Prompt Quality Standards](https://github.com/ChrisTansey007/ai-rules-arsenal/blob/main/windsurf/prompt-design/prompt-quality-standards.md) - Quality standards for templates

---

## 📖 Source

**Extracted from:** prompt-insights--0724c73c.md (2025-10-20)  
**Original pattern:** "Condense the prior response into a standardized reusable template."  
**Effectiveness:** 5/5 - Most transferable practice  
**Validation:** Key to building pattern libraries

---

## 🌟 Impact

**Without template extraction:**
Solve problem → Move on → Solve similar problem from scratch → Repeat

**With template extraction:**
Solve problem → Extract template → Reuse for similar problems → Build library over time

**Result:** 10x faster on recurring patterns!** 🚀
