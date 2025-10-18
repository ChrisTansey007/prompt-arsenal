# Contributing to AI Prompts Repository

Thank you for your interest in contributing! This repository thrives on community contributions of prompts, configurations, and improvements.

## 🎯 Ways to Contribute

### 1. Submit a New Prompt
Share your favorite or most effective prompts with the community.

### 2. Improve Existing Prompts
Enhance prompts with better examples, clearer instructions, or additional use cases.

### 3. Add Tool Configurations
Contribute configurations for AI coding tools (Cursor, Windsurf, etc.).

### 4. Report Issues
Found a broken prompt or incorrect information? Let us know!

### 5. Request Prompts
Open an issue to request prompts you'd like to see in the repository.

---

## 📝 Prompt Submission Guidelines

### Format Requirements

All prompts must follow this standard format:

```markdown
# Prompt Title

## Category
[e.g., Code Generation, Content Creation, etc.]

## Tags
`#tag1` `#tag2` `#tag3`

## Difficulty
Beginner | Intermediate | Advanced

## Description
Brief description of what this prompt does and when to use it.

## The Prompt
```
[Your actual prompt here]
```

## Variables
- `{variable1}`: Description of what this should be replaced with
- `{variable2}`: Description

## Example Usage
[Show the prompt with variables filled in]

## Expected Output
[Describe what kind of output to expect]

## Tips & Best Practices
- Tip 1
- Tip 2

## Variations
- **Variation 1**: Description
- **Variation 2**: Description

## Related Prompts
- [Link to related prompt 1]
- [Link to related prompt 2]
```

### File Naming

Use lowercase with hyphens:
- ✅ `generate-react-component.md`
- ✅ `seo-blog-outline.md`
- ❌ `Generate_React_Component.md`
- ❌ `SEO blog outline.md`

---

## 🔧 Tool Configuration Guidelines

### For AI Coding Tools

When contributing tool configurations:

1. **Include setup instructions** - How to install/use the config
2. **Add comments** - Explain what each section does
3. **Provide examples** - Show the config in action
4. **Specify versions** - Note which tool version it's tested with

#### Example Structure:
```markdown
# Tool Configuration Name

## Tool
[Tool name and version]

## Installation
Step-by-step instructions

## Configuration
```[language]
# Configuration file content with comments
```

## Usage Examples
How to use this configuration

## Best Practices
Tips for optimal results
```

---

## 🤖 Custom Agent Guidelines

When contributing custom agents:

1. **Clear purpose** - Define what the agent does
2. **System prompt** - Provide the complete system prompt
3. **Use cases** - List 3-5 scenarios where it's useful
4. **Example interactions** - Show input/output examples
5. **Customization guide** - Explain how to adapt it

---

## 🚀 Submission Process

### Step 1: Fork the Repository
Click the "Fork" button in the top right of the GitHub page.

### Step 2: Clone Your Fork
```bash
git clone https://github.com/YOUR-USERNAME/ai-prompts.git
cd ai-prompts
```

### Step 3: Create a Branch
```bash
git checkout -b add-my-awesome-prompt
```

### Step 4: Add Your Content
- Place files in the appropriate directory
- Follow the format guidelines above
- Ensure all links work

### Step 5: Commit Your Changes
```bash
git add .
git commit -m "Add: [Brief description of what you added]"
```

Good commit messages:
- ✅ `Add: Python debugging prompt for FastAPI`
- ✅ `Update: Cursor rules template with TypeScript examples`
- ✅ `Fix: Broken link in API agent documentation`

### Step 6: Push to Your Fork
```bash
git push origin add-my-awesome-prompt
```

### Step 7: Submit a Pull Request
1. Go to your fork on GitHub
2. Click "Pull Request"
3. Provide a clear title and description
4. Reference any related issues

---

## ✅ Pull Request Checklist

Before submitting, ensure:

- [ ] Follows the standard format
- [ ] File names use lowercase with hyphens
- [ ] Placed in the correct directory
- [ ] All links are working
- [ ] No typos or grammatical errors
- [ ] Variables are clearly marked (e.g., `{VARIABLE}`)
- [ ] Includes at least one example
- [ ] Tags are appropriate and formatted correctly
- [ ] Tested the prompt/configuration yourself

---

## 🏷️ Tagging Guidelines

Use relevant tags to help others discover your contribution:

### Technique Tags
`#zero-shot` `#few-shot` `#chain-of-thought` `#xml` `#meta-prompting`

### Use Case Tags
`#content` `#coding` `#seo` `#marketing` `#debugging` `#research` `#business` `#creative`

### Tool Tags
`#chatgpt` `#claude` `#cursor` `#windsurf` `#copilot` `#roo-code` `#cody` `#continue` `#aider`

### Agent Type Tags
`#custom-agent` `#code-agent` `#content-agent` `#business-agent` `#research-agent`

### Language Tags
`#python` `#javascript` `#typescript` `#react` `#nodejs`

### Complexity Tags
`#beginner` `#intermediate` `#advanced`

---

## 🎨 Style Guidelines

### Markdown Formatting
- Use `###` for section headings (not `####` or deeper)
- Use code blocks with language tags: ` ```python ` not just ` ``` `
- Use **bold** for emphasis, not *italics*
- Use `-` for lists, not `*` or `1.`

### Writing Style
- **Clear and concise** - Get to the point quickly
- **Action-oriented** - Use active voice
- **Practical** - Include real-world examples
- **Professional** - Maintain a helpful, respectful tone

### Code Examples
- **Syntax highlighted** - Always specify the language
- **Complete** - Include necessary imports/setup
- **Commented** - Explain complex parts
- **Tested** - Ensure it actually works

---

## 🚫 What NOT to Submit

Please don't submit:

- ❌ **Malicious prompts** - No jailbreaks, harmful content, or exploits
- ❌ **Copyrighted material** - Only submit original work or properly attributed content
- ❌ **Untested prompts** - Test before submitting
- ❌ **Vague prompts** - Be specific and clear
- ❌ **Duplicate content** - Check if it already exists
- ❌ **Personal information** - No API keys, passwords, or sensitive data

---

## 🌟 Recognition

Contributors will be:
- Listed in our Contributors section
- Credited in prompt metadata
- Featured in community highlights (with permission)
- Eligible for special badges and recognition

---

## 📋 Issue Guidelines

### Reporting Bugs
Use this template:
```markdown
**Prompt/File:**
[Link to the file]

**Issue:**
[Clear description of the problem]

**Expected Behavior:**
[What should happen]

**Steps to Reproduce:**
1. Step 1
2. Step 2

**Screenshots:**
[If applicable]
```

### Requesting Prompts
Use this template:
```markdown
**Category:**
[e.g., Code Generation, Content Creation]

**Tool (if applicable):**
[e.g., Cursor, Windsurf]

**Use Case:**
[Describe what you want to accomplish]

**Details:**
[Any specific requirements or preferences]
```

---

## 💬 Community Guidelines

- **Be respectful** - Treat everyone with kindness
- **Be constructive** - Provide helpful feedback
- **Be patient** - Maintainers are volunteers
- **Be collaborative** - Work together to improve
- **Be inclusive** - Welcome contributors of all skill levels

---

## 📞 Questions?

If you have questions about contributing:
- Open a [Discussion](https://github.com/YOUR-USERNAME/ai-prompts/discussions)
- Check existing [Issues](https://github.com/YOUR-USERNAME/ai-prompts/issues)
- Email: chris.s.tansey@gmail.com

---

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for making this repository better! 🙏**
