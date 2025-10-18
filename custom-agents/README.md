# 🤖 Custom AI Agents

Specialized AI agent configurations for specific domains and use cases. Each agent includes a complete system prompt, example interactions, and customization guidelines.

## 📁 Agent Categories

### [Content Creation Agents](./content-creation-agents/)
Agents for writing, editing, and optimizing content:
- **[Blog Writer Agent](./content-creation-agents/blog-writer-agent.md)** - Long-form articles with SEO
- **[Social Media Agent](./content-creation-agents/social-media-agent.md)** - Platform-specific posts
- **[SEO Specialist Agent](./content-creation-agents/seo-specialist-agent.md)** - Keyword research & optimization

### [Research Agents](./research-agents/)
Agents for analysis and information extraction:
- **[Data Analyst Agent](./research-agents/data-analyst-agent.md)** - Statistical analysis & insights
- **[Summarizer Agent](./research-agents/summarizer-agent.md)** - Document summarization

### [Business Agents](./business-agents/)
Agents for business operations:
- **[Customer Support Agent](./business-agents/customer-support-agent.md)** - Ticket responses & FAQs
- **[Email Assistant Agent](./business-agents/email-assistant-agent.md)** - Professional email drafting
- **[Project Manager Agent](./business-agents/project-manager-agent.md)** - Task breakdown & planning

### [Creative Agents](./creative-agents/)
Agents for creative work:
- **[Brainstorming Agent](./creative-agents/brainstorming-agent.md)** - Idea generation
- **[Storytelling Agent](./creative-agents/storytelling-agent.md)** - Narrative creation

### [Specialized Agents](./specialized-agents/)
Technical and domain-specific agents:
- **[Code Review Agent](./specialized-agents/code-review-agent.md)** - Structured code reviews
- **[Database Agent](./specialized-agents/database-agent.md)** - SQL optimization
- **[API Development Agent](./specialized-agents/api-agent.md)** - RESTful API design
- **[Testing Agent](./specialized-agents/testing-agent.md)** - Test generation & coverage

---

## 🚀 How to Use Custom Agents

### Step 1: Choose an Agent
Browse the categories above and select an agent that matches your use case.

### Step 2: Set as System Prompt
Copy the agent's system prompt and use it in your AI interface:

**For ChatGPT:**
1. Go to Settings → Personalization → Custom Instructions
2. Paste the system prompt in "How would you like ChatGPT to respond?"

**For Claude:**
1. Start a new project
2. Set the system prompt in project instructions

**For AI Coding Tools:**
1. See tool-specific instructions in each agent file
2. Usually placed in tool's configuration file

### Step 3: Customize Variables
Replace placeholders like `{TOPIC}`, `{STYLE}`, `{INDUSTRY}` with your specifics.

### Step 4: Test & Iterate
- Test with sample inputs
- Refine the system prompt based on results
- Save successful variations

---

## 🎯 Agent Structure

Each agent includes:

```markdown
# Agent Name

## Agent Type
[Category]

## System Prompt
[The complete system prompt to use]

## Variables
[Customizable placeholders]

## Example Interactions
[Input/output examples]

## Use Cases
[When to use this agent]

## Customization Guide
[How to adapt for your needs]

## Best Practices
[Tips for optimal results]
```

---

## 💡 Creating Your Own Agent

### 1. Define the Purpose
Be specific about what the agent should do:
- ✅ "Technical documentation writer for API endpoints"
- ❌ "Help with writing stuff"

### 2. Set Clear Boundaries
Define what the agent should and shouldn't do:
```markdown
Your role:
- Write technical documentation
- Explain complex concepts simply
- Include code examples

You should NOT:
- Write marketing copy
- Provide legal advice
- Make business decisions
```

### 3. Specify Output Format
Be explicit about how responses should be structured:
```markdown
Response format:
1. Brief summary
2. Detailed explanation
3. Code example (if applicable)
4. Related resources
```

### 4. Include Examples
Show the agent what good outputs look like:
```markdown
Example input: "Document the POST /users endpoint"
Example output: [Show ideal documentation]
```

### 5. Add Context
Provide relevant background:
```markdown
Context:
- Target audience: Software developers
- Technical level: Intermediate
- Documentation style: Concise, example-driven
```

---

## 🏷️ Tags

Find agents by:
- **Domain:** `#content` `#research` `#business` `#creative` `#technical`
- **Skill Level:** `#beginner` `#intermediate` `#advanced`
- **Output Type:** `#text` `#code` `#data` `#analysis`
- **Use Case:** `#writing` `#analysis` `#support` `#development`

---

## 📋 Best Practices

### For All Agents

1. **Start Broad, Then Specialize**
   - Begin with general agent
   - Add specific requirements gradually
   - Test each modification

2. **Provide Context**
   - Explain your industry/domain
   - Define your target audience
   - Specify any constraints

3. **Use Examples**
   - Include input/output examples
   - Show edge cases
   - Demonstrate desired tone/style

4. **Iterate Based on Results**
   - Track what works/doesn't
   - Refine system prompt iteratively
   - Document successful patterns

### Domain-Specific Tips

**Content Agents:**
- Specify tone, style, and target audience
- Include SEO requirements if applicable
- Define word count or length expectations

**Research Agents:**
- Define analysis depth required
- Specify citation/source requirements
- Clarify output format (bullet points, paragraphs, tables)

**Business Agents:**
- Set professional tone and formality level
- Include company-specific guidelines
- Specify response time expectations

**Technical Agents:**
- Define technical depth
- Specify code style and standards
- Include framework/library versions

---

## 🤝 Contributing

Have a great custom agent? Share it!

1. Use the [agent template](../templates/agent-template.md)
2. Test thoroughly with diverse inputs
3. Include clear examples
4. Document customization options
5. Submit a pull request

See [CONTRIBUTING.md](../CONTRIBUTING.md) for details.

---

## 📚 Related Resources

- [AI Coding Tools](../ai-coding-tools/) - Tool-specific configurations
- [AI Agents](../ai-agents/) - General agent architectures
- [Prompting Techniques](../prompting-techniques/) - Fundamental techniques
- [Templates](../templates/) - Reusable templates

---

## 🆕 Recently Added

- **Code Review Agent** - Structured code review process
- **Database Agent** - SQL query optimization
- **API Development Agent** - RESTful API patterns
- **Testing Agent** - Comprehensive test generation

---

**Questions?** Open an issue or check the [main README](../README.md)
