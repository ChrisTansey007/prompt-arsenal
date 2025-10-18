# 🎯 Prompting Techniques

Master the fundamentals of prompt engineering with battle-tested techniques for better AI interactions.

## 📚 Available Techniques

### [Zero-Shot Prompting](./zero-shot/)
Get results without providing examples. The AI uses its pre-trained knowledge to understand and respond to your request.

**When to use:** Simple, straightforward tasks where the AI already knows what to do.

**Example:**
```
Translate this to Spanish: "Hello, how are you?"
```

---

### [Few-Shot Prompting](./few-shot/)
Provide a few examples to guide the AI's responses. The AI learns the pattern from your examples.

**When to use:** When you need consistent formatting or specific output style.

**Example:**
```
Convert these to questions:
Statement: The sky is blue.
Question: Is the sky blue?

Statement: Dogs are mammals.
Question: Are dogs mammals?

Statement: Water boils at 100°C.
Question: [AI completes this]
```

---

### [Chain of Thought](./chain-of-thought/)
Ask the AI to think step-by-step through complex problems. Improves reasoning and reduces errors.

**When to use:** Complex reasoning, math problems, multi-step tasks.

**Example:**
```
Solve this step by step:
If a train travels 60 mph for 2.5 hours, how far does it go?

Let's think through this:
1. First, identify what we know...
```

---

### [Tree of Thought](./tree-of-thought/)
Explore multiple reasoning paths simultaneously. The AI considers different approaches before choosing the best one.

**When to use:** Complex problems with multiple possible solutions.

**Example:**
```
Design a database schema for an e-commerce site.
Consider multiple approaches:
- Approach 1: Normalized design
- Approach 2: Denormalized for performance
- Approach 3: Hybrid approach

Evaluate each and choose the best.
```

---

### [Meta Prompting](./meta-prompting/)
Create prompts that generate other prompts. Build prompt generators and prompt improvement systems.

**When to use:** Automating prompt creation, building AI systems that improve themselves.

**Example:**
```
Create a prompt that will help generate blog post outlines.
The prompt should ask for: topic, target audience, key points, and SEO keywords.
```

---

### [XML Structured Prompts](./xml-structured/)
Use XML tags to organize complex prompts. Makes large prompts more readable and maintainable.

**When to use:** Complex multi-part instructions, agent system prompts.

**Example:**
```xml
<task>
  <role>You are a Python expert</role>
  <context>
    <project>FastAPI application</project>
    <requirements>
      - Type hints required
      - Pytest for testing
    </requirements>
  </context>
  <instructions>
    Create a user authentication endpoint
  </instructions>
</task>
```

---

### [Prompt Chaining](./prompt-chaining/)
Connect multiple prompts where each builds on the previous output. Create sophisticated workflows.

**When to use:** Multi-stage processes, complex workflows.

**Example:**
```
Prompt 1: Generate blog post ideas about AI
↓ (output becomes input)
Prompt 2: Expand the best idea into an outline
↓
Prompt 3: Write the introduction section
```

---

### [Automatic Prompt Engineering](./automatic-prompt-engineering/)
Let AI optimize your prompts automatically. The AI suggests improvements to your prompts.

**When to use:** Improving existing prompts, finding better phrasings.

**Example:**
```
Optimize this prompt for better results:
"Write a blog post about dogs"

Improved version:
"Write a 500-word SEO-optimized blog post about dog training for first-time owners. 
Include 3 practical tips and use a friendly, encouraging tone."
```

---

## 🎓 Learning Path

### Beginner
1. Start with **Zero-Shot** - Understand basic prompting
2. Try **Few-Shot** - Learn from examples
3. Practice **Clear Instructions** - Be specific

### Intermediate
4. Use **Chain of Thought** - Improve reasoning
5. Try **XML Structure** - Organize complex prompts
6. Experiment with **Prompt Chaining** - Build workflows

### Advanced
7. Master **Tree of Thought** - Multiple reasoning paths
8. Use **Meta Prompting** - Generate prompts
9. Implement **Automatic Engineering** - Optimize prompts

---

## 💡 General Prompting Best Practices

### Be Specific
❌ "Write about AI"
✅ "Write a 300-word explanation of how GPT models work, for non-technical readers"

### Provide Context
❌ "Debug this code"
✅ "Debug this Python FastAPI endpoint that's returning 500 errors. The issue started after adding authentication middleware."

### Define Output Format
❌ "List pros and cons"
✅ "List 5 pros and 5 cons in a markdown table format"

### Use Examples
❌ "Format this data"
✅ "Format like this: Name: John | Age: 30 | City: NYC"

### Iterate and Refine
- Start simple
- Test the output
- Add constraints
- Refine based on results

---

## 🏷️ Technique Comparison

| Technique | Complexity | Use Case | Examples Needed |
|-----------|------------|----------|-----------------|
| Zero-Shot | Low | Simple tasks | 0 |
| Few-Shot | Medium | Pattern learning | 2-5 |
| Chain of Thought | Medium | Reasoning | 0-1 |
| Tree of Thought | High | Complex problems | 0 |
| Meta Prompting | High | Automation | 0 |
| XML Structured | Medium | Organization | 0 |
| Prompt Chaining | High | Workflows | Varies |

---

## 🤝 Contributing

Have a great prompting technique or example? We'd love to include it!

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

---

## 📚 Related Resources

- [AI Agents](../ai-agents/) - Apply techniques to agents
- [Custom Agents](../custom-agents/) - See techniques in practice
- [Templates](../templates/) - Reusable prompt templates

---

**Questions?** Check the [main README](../README.md) or open an issue!
