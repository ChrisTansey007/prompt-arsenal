# Windsurf - AI Coding Prompts & Configurations

**Codeium's Agentic IDE with Cascade and Flow modes**

## 📁 What's Included

- **[Cascade Rules](./cascade-rules.md)** - Global rules for AI behavior in Windsurf
- **[System Prompts](./system-prompts/)** - Language and framework-specific prompts
- **[Project Templates](./project-templates/)** - Starter configurations for common project types
- **[Best Practices](./best-practices.md)** - Optimal usage patterns and workflows

---

## 🚀 Quick Start

### 1. Create Cascade Rules File

In your project root, create `.windsurf/cascade-rules.md` or `cascade-rules.md`:

```bash
# In your project directory
mkdir -p .windsurf
touch .windsurf/cascade-rules.md
```

### 2. Copy a Template

Choose a template from this directory based on your project:
- [Python Project Rules](./system-prompts/python-agent.md)
- [JavaScript/TypeScript Rules](./system-prompts/javascript-agent.md)
- [React Project Rules](./project-templates/react-project.md)
- [API Development Rules](./project-templates/api-project.md)

### 3. Customize Variables

Replace placeholders like `{PROJECT_NAME}`, `{TECH_STACK}`, etc.

### 4. Use Cascade

- **Cascade Mode**: For complex, multi-file tasks
- **Flow Mode**: For quick edits and suggestions
- Cascade will follow your rules automatically!

---

## 🎯 Available System Prompts

### Language-Specific

| Language | File | Use For |
|----------|------|---------|
| Python | [python-agent.md](./system-prompts/python-agent.md) | PEP 8, type hints, pytest |
| JavaScript | [javascript-agent.md](./system-prompts/javascript-agent.md) | ES6+, async/await |
| TypeScript | [typescript-agent.md](./system-prompts/typescript-agent.md) | Type safety, interfaces |

### Specialized Agents

| Agent Type | File | Use For |
|------------|------|---------|
| Security-Focused | [security-agent.md](./system-prompts/security-agent.md) | Input validation, secure coding |
| Performance-Optimized | [performance-agent.md](./system-prompts/performance-agent.md) | O(n) complexity, optimization |
| Code Review | [code-review-agent.md](./system-prompts/code-review-agent.md) | Structured reviews |
| Testing | [testing-agent.md](./system-prompts/testing-agent.md) | Unit, integration, E2E tests |

---

## 📋 Project Templates

Pre-configured rules for common project types:

- **[React + TypeScript](./project-templates/react-typescript.md)** - Modern React with TS
- **[Next.js](./project-templates/nextjs.md)** - Full-stack Next.js projects
- **[Python API](./project-templates/python-api.md)** - FastAPI or Flask
- **[Node.js API](./project-templates/nodejs-api.md)** - Express.js REST APIs
- **[Full-Stack](./project-templates/fullstack.md)** - Frontend + Backend

---

## 💡 Best Practices

### Cascade Rules Structure

```markdown
# Project Context
[Brief description of your project]

## Tech Stack
- Language: [e.g., Python 3.11]
- Framework: [e.g., FastAPI]
- Database: [e.g., PostgreSQL]
- Key Libraries: [list main dependencies]

## Coding Standards
[Your team's standards]

## AI Instructions
[What Cascade should do/avoid]

## File Structure
[Important paths and conventions]
```

### Effective Rule Writing

**Do:**
- ✅ Be specific about your tech stack
- ✅ Include version numbers
- ✅ Define clear quality standards
- ✅ List important dependencies
- ✅ Specify file organization

**Don't:**
- ❌ Make rules too generic
- ❌ Write overly long instructions
- ❌ Forget to update as project evolves
- ❌ Duplicate standard language conventions

### Using Cascade Effectively

**For Feature Development:**
1. Write clear requirements in natural language
2. Let Cascade plan the architecture
3. Review the plan before implementation
4. Cascade will follow your cascade-rules automatically

**For Refactoring:**
1. Describe what needs improvement
2. Cascade will analyze and suggest changes
3. Review changes before applying
4. Iterate based on results

**For Debugging:**
1. Explain the bug and symptoms
2. Cascade will investigate across files
3. Propose fixes with explanations
4. Test the solution

---

## 🏷️ Tags

`#windsurf` `#cascade` `#flow` `#ide` `#agentic` `#codeium`

---

## 🔗 Related

- [Cursor](../cursor/) - Alternative AI-first IDE
- [Coding Development](../../coding-development/) - General coding prompts
- [Vibe Coding](../../vibe-coding/) - Collaborative workflows

---

**Need Help?** Check the [Windsurf Documentation](https://docs.codeium.com/windsurf) or open an issue!
