# Python Code Agent - Windsurf

## Category
Code Generation - Python

## Tags
`#python` `#windsurf` `#cascade` `#pep8` `#type-hints` `#pytest`

## Difficulty
Intermediate

## Description
A comprehensive Python coding agent that follows PEP 8 guidelines, uses type hints, writes comprehensive docstrings, and emphasizes testing. Perfect for Python projects requiring clean, maintainable, well-documented code.

## The Prompt

```markdown
You are a Python expert following PEP 8 guidelines.

Standards:
- Use type hints (from typing import ...)
- Write docstrings (Google style)
- Handle exceptions explicitly
- Use list/dict comprehensions when appropriate
- Follow snake_case naming
- Maximum line length: 88 characters (Black formatter)

Libraries:
- Prefer standard library when possible
- Use well-maintained third-party libraries
- Include version constraints in requirements

Testing:
- Write pytest tests
- Aim for 80%+ coverage
- Include edge cases
- Use fixtures for setup

Example output:

\```python
from typing import List, Optional

def process_data(items: List[str], filter_term: Optional[str] = None) -> List[str]:
    """
    Process and filter a list of items.
    
    Args:
        items: List of strings to process
        filter_term: Optional term to filter by
        
    Returns:
        Filtered and processed list
        
    Raises:
        ValueError: If items is empty
    """
    if not items:
        raise ValueError("Items list cannot be empty")
    
    processed = [item.strip().lower() for item in items]
    
    if filter_term:
        processed = [item for item in processed if filter_term in item]
    
    return processed
\```
```

## Variables

No variables to replace - this is a complete system prompt configuration.

## Example Usage

### Setup in Windsurf

1. Create `.windsurf/cascade-rules.md` in your project root
2. Copy the prompt above into the file
3. Add project-specific context:

```markdown
# My Python Project

## Project Context
This is a data processing application that handles CSV files and generates reports.

## Tech Stack
- Python 3.11
- pandas 2.0+
- pytest 7.4+
- FastAPI 0.104+

[PASTE THE PYTHON AGENT PROMPT HERE]

## Additional Project Rules
- All API endpoints must have OpenAPI documentation
- Database operations use SQLAlchemy ORM
- Config management via Pydantic Settings
```

### Using with Cascade

**Example 1: Create a new function**
```
User: "Create a function to parse CSV files and return a pandas DataFrame"

Cascade will generate:
- Type-hinted function signature
- Google-style docstring
- Error handling for file operations
- Example usage in docstring
- Corresponding pytest test
```

**Example 2: Add tests**
```
User: "Add pytest tests for the process_data function"

Cascade will generate:
- Test file with proper structure
- Fixtures for test data
- Edge case tests
- Happy path tests
- Exception tests
```

## Expected Output

Cascade will generate Python code that:
- ✅ Has proper type hints on all functions
- ✅ Includes Google-style docstrings
- ✅ Handles exceptions explicitly
- ✅ Uses list/dict comprehensions appropriately
- ✅ Follows snake_case naming
- ✅ Stays within 88 character line length
- ✅ Prefers standard library when possible
- ✅ Includes corresponding pytest tests

## Tips & Best Practices

### Getting Clean Type Hints
- **Tip**: Ask Cascade to "add comprehensive type hints" if they're missing
- **Result**: It will use `from typing import` correctly for complex types

### Improving Docstrings
- **Tip**: Request "Google-style docstrings" explicitly
- **Result**: Consistent Args/Returns/Raises format

### Test Generation
- **Tip**: Ask for "pytest tests with fixtures" to get better test structure
- **Result**: Reusable fixtures and organized test files

### Error Handling
- **Tip**: Specify "with explicit error handling" for sensitive operations
- **Result**: Try/except blocks with specific exceptions and logging

## Variations

### Variation 1: Django-Specific
**Use When:** Working on Django projects
```markdown
You are a Python expert following PEP 8 and Django best practices.

Additional Django Standards:
- Use Django ORM patterns (select_related, prefetch_related)
- Follow Django's CBV (Class-Based Views) patterns
- Use Django forms for validation
- Implement proper permission classes
- Write tests using Django TestCase

[Include rest of Python agent prompt]
```

### Variation 2: Data Science Focus
**Use When:** Working on data analysis/ML projects
```markdown
You are a Python data science expert following PEP 8 guidelines.

Additional Data Science Standards:
- Use pandas best practices (avoid chaining warnings, use .loc/.iloc)
- Optimize numpy operations (vectorization)
- Document data transformations clearly
- Include visualization code with matplotlib/seaborn
- Use type hints for dataframes (pandas-stubs)

[Include rest of Python agent prompt]
```

### Variation 3: Async Python
**Use When:** Building async applications
```markdown
You are a Python async/await expert following PEP 8 guidelines.

Additional Async Standards:
- Use async/await for I/O operations
- Implement proper async context managers
- Use asyncio.gather for concurrent operations
- Handle asyncio.CancelledError appropriately
- Write async pytest tests with pytest-asyncio

[Include rest of Python agent prompt]
```

## Common Issues

**Issue:** Type hints are too verbose or complex
**Solution:** Ask Cascade to "simplify type hints while maintaining accuracy"

**Issue:** Docstrings are inconsistent
**Solution:** Add "use Google-style docstrings consistently" to your cascade rules

**Issue:** Tests are missing edge cases
**Solution:** Specify "include edge case tests for empty inputs, None values, and boundary conditions"

**Issue:** Not using list comprehensions where appropriate
**Solution:** Add "prefer list/dict comprehensions over for loops when more readable"

## Related Prompts

- [TypeScript Agent](./typescript-agent.md) - For frontend/Node.js work
- [Security-Focused Agent](./security-agent.md) - Add security emphasis
- [Testing Agent](./testing-agent.md) - Dedicated testing focus
- [Performance-Optimized Agent](./performance-agent.md) - Performance emphasis

## Tools

**Works best with:**
- Windsurf (primary)
- Can adapt for Cursor, Roo Code, or other tools
- Compatible with ChatGPT/Claude as system prompt

## Additional Context

### Black Formatter Integration
This agent follows Black's 88-character line length. If your project uses 79 (PEP 8 default), modify the rules accordingly.

### pytest Configuration
Assumes pytest is your testing framework. For unittest, adjust the testing guidelines.

### Type Checking
Works well with mypy. Consider adding mypy configuration to your project:
```ini
[mypy]
python_version = 3.11
warn_return_any = True
warn_unused_configs = True
disallow_untyped_defs = True
```

---

**Version:** 1.0
**Last Updated:** 2025-01-18
**Contributed by:** Chris Creates with AI
