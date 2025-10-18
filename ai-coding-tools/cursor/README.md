# Cursor - AI Coding Prompts & Configurations

**AI-First Code Editor with Composer and Chat**

## 📁 What's Included

- **[Rules for AI](./rules-for-ai.md)** - `.cursorrules` file templates
- **[Cursorrules Templates](./cursorrules-templates/)** - Language and framework-specific rules
- **[Composer Prompts](./composer-prompts.md)** - Multi-file editing prompts
- **[Custom Instructions](./custom-instructions.md)** - Per-project AI instructions

---

## 🚀 Quick Start

### 1. Create .cursorrules File

In your project root, create `.cursorrules`:

```bash
# In your project directory
touch .cursorrules
```

### 2. Choose a Template

Select based on your project:
- [Python Project](./cursorrules-templates/python.cursorrules)
- [React + TypeScript](./cursorrules-templates/react-typescript.cursorrules)
- [Next.js](./cursorrules-templates/nextjs.cursorrules)
- [Node.js API](./cursorrules-templates/nodejs-api.cursorrules)

### 3. Customize for Your Project

```
Project: My Awesome App
Stack: Next.js 14, TypeScript, Prisma, TailwindCSS
Style: Modern, type-safe, performance-focused

[Add your rules here]
```

### 4. Use Cursor Features

- **Chat**: Quick questions and code snippets (Cmd/Ctrl+L)
- **Composer**: Multi-file changes and refactoring (Cmd/Ctrl+I)
- **Tab**: Code completion as you type
- **Cmd+K**: Inline edits and quick fixes

---

## 📋 .cursorrules Structure

```
# Project Context
Brief description of your project

## Tech Stack
- Language: [version]
- Framework: [version]
- Key Libraries: [list]

## Code Style
- Formatting: [Prettier/ESLint config]
- Naming: [conventions]
- File organization: [structure]

## AI Instructions
What Cursor should do/avoid

## Special Considerations
Project-specific requirements
```

---

## 💡 Best Practices

### Effective .cursorrules

**Do:**
- ✅ Keep it concise (< 500 lines)
- ✅ Be specific about tech stack versions
- ✅ Include code style preferences
- ✅ Define file structure
- ✅ Update as project evolves

**Don't:**
- ❌ Copy entire style guides
- ❌ Include obvious language rules
- ❌ Make it too generic
- ❌ Forget to commit to version control

### Using Composer

**For Architecture Changes:**
```
Refactor the user authentication system to use JWT instead of sessions.
Update all related files including routes, middleware, and tests.
```

**For Feature Addition:**
```
Add a password reset feature:
1. Create reset token endpoint
2. Add email service
3. Build reset form component
4. Add tests
```

**For Bug Fixes:**
```
Fix the issue where user profile doesn't update.
Check the API endpoint, frontend form, and database query.
```

---

## 🏷️ Tags

`#cursor` `#ide` `#composer` `#cursorrules` `#ai-coding`

---

## 🔗 Related

- [Windsurf](../windsurf/) - Alternative agentic IDE
- [GitHub Copilot](../github-copilot/) - Microsoft's AI assistant
- [Coding Development](../../coding-development/) - General coding prompts

---

**Need Help?** Check [Cursor Documentation](https://cursor.sh/docs) or open an issue!
