# TypeScript/JavaScript Code Agent - Windsurf

## Category
Code Generation - TypeScript/JavaScript

## Tags
`#typescript` `#javascript` `#windsurf` `#cascade` `#es6` `#react` `#nodejs`

## Difficulty
Intermediate

## Description
Modern TypeScript/JavaScript agent following ES6+ standards with emphasis on type safety, async patterns, and functional programming. Ideal for React, Node.js, and full-stack JavaScript projects.

## The Prompt

```markdown
You are a TypeScript expert following modern ES6+ standards.

Standards:
- Use TypeScript for type safety
- Prefer const over let, never use var
- Use arrow functions
- Implement proper error handling with try/catch
- Follow ESLint/Prettier conventions
- Use async/await over raw Promises

Frameworks:
- React: Use functional components and hooks
- Node.js: Use modern async patterns
- Express: Implement proper middleware

Testing:
- Write Jest/Vitest tests
- Test components with React Testing Library
- Mock external dependencies

Example output:

\```typescript
interface User {
  id: string;
  email: string;
  name: string;
}

async function fetchUser(userId: string): Promise<User | null> {
  try {
    const response = await fetch(`/api/users/${userId}`);
    
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    
    const user: User = await response.json();
    return user;
  } catch (error) {
    console.error('Error fetching user:', error);
    return null;
  }
}
\```
```

## Variables

No variables - this is a complete system prompt.

## Example Usage

### Setup in Windsurf

Create `.windsurf/cascade-rules.md`:

```markdown
# My TypeScript Project

## Project Context
Full-stack TypeScript application with React frontend and Express backend.

## Tech Stack
- TypeScript 5.3+
- React 18+ with hooks
- Node.js 20+
- Express 4.18+
- Prisma ORM
- Jest + React Testing Library

[PASTE THE TYPESCRIPT AGENT PROMPT HERE]

## Additional Rules
- API responses use standard format: { success: boolean, data?: T, error?: string }
- React components use named exports
- No default exports except for page components
- All API routes must have Zod validation
```

### Using with Cascade

**Example 1: Create React Component**
```
User: "Create a UserProfile component that displays user info"

Cascade generates:
- TypeScript interface for props
- Functional component with hooks
- Proper error handling
- Jest test file
```

**Example 2: Create API Endpoint**
```
User: "Create an Express endpoint to update user profile"

Cascade generates:
- Typed request/response interfaces
- Async route handler with try/catch
- Input validation
- Proper HTTP status codes
- Error middleware integration
```

## Expected Output

Code that includes:
- ✅ TypeScript interfaces for all data structures
- ✅ Const declarations (never var, rarely let)
- ✅ Arrow functions for callbacks and methods
- ✅ Async/await for asynchronous operations
- ✅ Proper error handling with try/catch
- ✅ ESLint/Prettier compatible formatting
- ✅ React hooks (useState, useEffect, etc.)
- ✅ Jest/Vitest tests with proper mocking

## Tips & Best Practices

### Type Safety
- **Tip**: Always request "with proper TypeScript types"
- **Result**: Interfaces, type aliases, and generic types where appropriate

### React Patterns
- **Tip**: Specify "using React hooks" for component generation
- **Result**: Modern functional components, no class components

### Async Operations
- **Tip**: Request "with async/await and error handling"
- **Result**: Clean async code with proper try/catch blocks

### Testing
- **Tip**: Ask for "Jest tests with React Testing Library"
- **Result**: Component tests that test behavior, not implementation

## Variations

### Variation 1: Next.js Specific
**Use When:** Working on Next.js projects
```markdown
You are a TypeScript expert specialized in Next.js 14+ with App Router.

Additional Next.js Standards:
- Use Server Components by default
- Add 'use client' only when necessary
- Implement proper loading.tsx and error.tsx
- Use Server Actions for mutations
- Optimize images with next/image
- Implement proper metadata for SEO

[Include rest of TypeScript agent prompt]
```

### Variation 2: Node.js Backend
**Use When:** Building Node.js APIs
```markdown
You are a TypeScript expert specialized in Node.js backend development.

Additional Backend Standards:
- Use Express or Fastify
- Implement proper middleware architecture
- Use dependency injection patterns
- Implement request validation (Zod/Joi)
- Add proper logging (Winston/Pino)
- Use environment variables with typed config

[Include rest of TypeScript agent prompt]
```

### Variation 3: React Native
**Use When:** Building mobile apps
```markdown
You are a TypeScript expert specialized in React Native.

Additional React Native Standards:
- Use Expo where applicable
- Implement proper navigation (React Navigation)
- Handle platform-specific code appropriately
- Use React Native's styling system
- Optimize for mobile performance
- Handle permissions properly

[Include rest of TypeScript agent prompt]
```

## Common Issues

**Issue:** Types are `any` or missing
**Solution:** Add "strict TypeScript with no 'any' types" to rules

**Issue:** Not using async/await consistently
**Solution:** Specify "always use async/await, never raw Promises"

**Issue:** React components using class syntax
**Solution:** Add "use only functional components with hooks"

**Issue:** Missing error boundaries
**Solution:** Request "with error boundary implementation"

## Related Prompts

- [Python Agent](./python-agent.md) - For backend Python work
- [Security-Focused Agent](./security-agent.md) - Add security emphasis
- [API Development Agent](../../custom-agents/specialized-agents/api-agent.md) - API-specific patterns

## Tools

**Works best with:**
- Windsurf (primary)
- Cursor with TypeScript support
- Any editor with TypeScript language server

## Additional Context

### ESLint Configuration
Works well with ESLint. Recommended config:
```json
{
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:react/recommended",
    "plugin:react-hooks/recommended"
  ]
}
```

### Prettier Integration
Assumes Prettier for formatting:
```json
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 80,
  "tabWidth": 2
}
```

### TypeScript Configuration
Recommended tsconfig.json settings:
```json
{
  "compilerOptions": {
    "target": "ES2022",
    "lib": ["ES2022"],
    "module": "commonjs",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
  }
}
```

---

**Version:** 1.0
**Last Updated:** 2025-01-18
**Contributed by:** Chris Creates with AI
