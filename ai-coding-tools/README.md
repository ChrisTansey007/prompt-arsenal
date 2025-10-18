# 💻 AI Coding Tools

Tool-specific prompts, configurations, and system prompts for popular AI coding assistants.

## 🎯 Available Tools

### [Windsurf](./windsurf/)
**Codeium's Agentic IDE**
- Cascade rules for AI behavior
- System prompts for different languages
- Project templates
- Best practices and workflows

### [Cursor](./cursor/)
**AI-First Code Editor**
- `.cursorrules` templates
- Composer prompts for multi-file editing
- Custom instructions per project
- Language-specific configurations

### [Roo Code](./roo-code/)
**Open-Source AI Coding Assistant**
- System prompts and agent configs
- Workspace configurations
- Task-specific instructions

### [GitHub Copilot](./github-copilot/)
**Microsoft's AI Pair Programmer**
- `.github/copilot-instructions.md` templates
- Workspace-level prompts
- Code review configurations

### [Cody](./cody/)
**Sourcegraph's AI Assistant**
- Custom commands
- Context management

### [Continue](./continue/)
**Open-Source Copilot Alternative**
- Configuration templates
- Slash commands
- Custom model configs

### [Aider](./aider/)
**AI Pair Programming in Terminal**
- Coding patterns
- Workflow commands

### [Tabnine](./tabnine/)
**AI Code Completion**
- Team settings
- Custom configurations

---

## 🚀 Quick Start Guide

### 1. Choose Your Tool
Navigate to your tool's folder above.

### 2. Find the Right Configuration
Each tool folder contains:
- Setup instructions
- Configuration templates
- Example prompts
- Best practices

### 3. Customize for Your Project
- Copy the configuration file
- Replace variables with your project specifics
- Place in your project root or config location

### 4. Test and Iterate
- Run your tool with the new configuration
- Adjust based on results
- Share improvements back to this repo!

---

## 📋 Configuration File Locations

| Tool | Configuration File | Location |
|------|-------------------|----------|
| Windsurf | `cascade-rules.md` | Project root or `.windsurf/` |
| Cursor | `.cursorrules` | Project root |
| Roo Code | `system-prompt.md` | As configured in settings |
| GitHub Copilot | `copilot-instructions.md` | `.github/` directory |
| Cody | `cody.json` | `.vscode/` or project root |
| Continue | `config.json` | `~/.continue/` |
| Aider | `.aider.conf.yml` | Project root |
| Tabnine | Team settings | Tabnine dashboard |

---

## 🏷️ Common Tags

Find configurations by:
- **Language:** `#python` `#javascript` `#typescript` `#react` `#nodejs`
- **Framework:** `#nextjs` `#express` `#django` `#fastapi`
- **Use Case:** `#code-generation` `#code-review` `#debugging` `#testing`
- **Style:** `#security-focused` `#performance-optimized` `#clean-code`

---

## 💡 Best Practices

### For All Tools

1. **Start Generic, Then Customize**
   - Begin with a general template
   - Add project-specific requirements gradually
   - Test each addition

2. **Include Context**
   - Specify your tech stack
   - Define coding standards
   - List important dependencies

3. **Set Clear Boundaries**
   - Define what the AI should/shouldn't do
   - Specify output formats
   - Set quality standards

4. **Version Your Configs**
   - Commit configs to version control
   - Document changes
   - Share successful patterns with team

### Tool-Specific Tips

**Windsurf:**
- Use Cascade for complex multi-file tasks
- Set clear project context in rules
- Leverage Flow for quick edits

**Cursor:**
- Keep `.cursorrules` concise and focused
- Use Composer for architectural changes
- Update rules as project evolves

**GitHub Copilot:**
- Place instructions in `.github/` for team-wide consistency
- Use workspace prompts for project-specific patterns
- Combine with good code comments

---

## 🤝 Contributing

Have a great configuration for your tool? We'd love to include it!

1. Test it thoroughly in real projects
2. Follow the [contribution guidelines](../CONTRIBUTING.md)
3. Include setup instructions and examples
4. Submit a pull request

---

## 📚 Related Resources

- [AI Agents](../ai-agents/) - General agent configurations
- [Custom Agents](../custom-agents/) - Specialized agent prompts
- [Coding Development](../coding-development/) - Language-agnostic coding prompts
- [Vibe Coding](../vibe-coding/) - Collaborative AI development workflows

---

**Questions?** Open an issue or check the [main README](../README.md)
