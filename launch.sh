#!/bin/bash
# Prompt Arsenal - Automated Launch Script (Bash)
# This script will initialize git, create GitHub repo, and push everything

echo "🎯 Prompt Arsenal - Launch Script"
echo "================================="
echo ""

# Repository details
REPO_NAME="prompt-arsenal"
REPO_DESCRIPTION="Your comprehensive toolkit of powerful AI prompts, system configurations, and agent templates for ChatGPT, Claude, and AI coding tools"
REPO_PATH="$PWD"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Check if git is installed
echo -e "${YELLOW}🔍 Checking for git...${NC}"
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed. Please install git first.${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Git found!${NC}"

# Check if gh CLI is installed
echo -e "${YELLOW}🔍 Checking for GitHub CLI...${NC}"
if ! command -v gh &> /dev/null; then
    echo -e "${YELLOW}⚠️  GitHub CLI not found. Will provide manual instructions.${NC}"
    USE_MANUAL=true
else
    echo -e "${GREEN}✅ GitHub CLI found!${NC}"
    USE_MANUAL=false
fi

# Initialize git repository
echo ""
echo -e "${YELLOW}🎯 Initializing git repository...${NC}"
if [ -d ".git" ]; then
    echo -e "${YELLOW}⚠️  Git already initialized, skipping...${NC}"
else
    git init
    echo -e "${GREEN}✅ Git initialized!${NC}"
fi

# Add all files
echo ""
echo -e "${YELLOW}📦 Adding files to git...${NC}"
git add .
echo -e "${GREEN}✅ Files added!${NC}"

# Create initial commit
echo ""
echo -e "${YELLOW}💾 Creating initial commit...${NC}"
git commit -m "Initial commit: Prompt Arsenal - Your comprehensive AI prompts toolkit

Features:
- 4 production-ready coding agents (Python, TypeScript, Code Review, Security)
- AI Coding Tools configurations (Windsurf, Cursor)
- Custom Agents section with specialized prompts
- Prompting Techniques overview with 8 techniques
- Comprehensive documentation and contribution guidelines
- MIT License
- Ready for community contributions

Categories:
- Prompting Techniques
- AI Agents
- Custom Agents
- AI Coding Tools
- Content Creation
- Coding & Development
- Vibe Coding"

echo -e "${GREEN}✅ Initial commit created!${NC}"

# Create GitHub repository and push
echo ""
if [ "$USE_MANUAL" = false ]; then
    echo -e "${YELLOW}🚀 Creating GitHub repository...${NC}"
    echo ""
    echo -e "${CYAN}Choose repository visibility:${NC}"
    echo "1. Public (recommended)"
    echo "2. Private"
    read -p "Enter choice (1 or 2): " visibility
    
    if [ "$visibility" = "2" ]; then
        VISIBILITY_FLAG="--private"
    else
        VISIBILITY_FLAG="--public"
    fi
    
    echo ""
    echo -e "${YELLOW}Creating repository on GitHub...${NC}"
    
    # Create the repository
    if gh repo create "$REPO_NAME" "$VISIBILITY_FLAG" --source=. --remote=origin --description "$REPO_DESCRIPTION"; then
        echo -e "${GREEN}✅ GitHub repository created!${NC}"
        
        # Set main branch
        echo ""
        echo -e "${YELLOW}🔧 Setting main branch...${NC}"
        git branch -M main
        echo -e "${GREEN}✅ Main branch set!${NC}"
        
        # Push to GitHub
        echo ""
        echo -e "${YELLOW}📤 Pushing to GitHub...${NC}"
        if git push -u origin main; then
            echo ""
            echo -e "${GREEN}🎉 SUCCESS! Repository launched!${NC}"
            echo ""
            
            # Get repository URL
            REPO_URL=$(gh repo view --json url -q .url)
            echo -e "${CYAN}📍 Repository URL: $REPO_URL${NC}"
            echo ""
            echo -e "${YELLOW}✨ Next Steps:${NC}"
            echo "1. Visit your repository: $REPO_URL"
            echo "2. Add topics in repository settings"
            echo "3. Enable Issues and Discussions"
            echo "4. Share on social media!"
            echo ""
            echo -e "${YELLOW}📋 Recommended Topics:${NC}"
            echo "ai, prompts, chatgpt, claude, prompt-engineering, ai-agents,"
            echo "cursor, windsurf, github-copilot, coding-tools, custom-agents"
        else
            echo -e "${RED}❌ Failed to push to GitHub${NC}"
            echo -e "${YELLOW}Run: git push -u origin main${NC}"
        fi
    else
        echo -e "${RED}❌ Failed to create GitHub repository${NC}"
        echo ""
        echo -e "${YELLOW}Please create manually at: https://github.com/new${NC}"
    fi
else
    # Manual instructions
    echo -e "${YELLOW}📋 Manual Setup Required${NC}"
    echo ""
    echo "GitHub CLI is not installed. Please complete these steps:"
    echo ""
    echo -e "${CYAN}1. Create repository on GitHub:${NC}"
    echo "   - Go to: https://github.com/new"
    echo "   - Name: prompt-arsenal"
    echo "   - Description: $REPO_DESCRIPTION"
    echo "   - Choose: Public"
    echo "   - DO NOT initialize with README, .gitignore, or license"
    echo ""
    echo -e "${CYAN}2. After creating, run these commands:${NC}"
    echo ""
    echo -e "${YELLOW}   git remote add origin https://github.com/YOUR-USERNAME/prompt-arsenal.git${NC}"
    echo -e "${YELLOW}   git branch -M main${NC}"
    echo -e "${YELLOW}   git push -u origin main${NC}"
    echo ""
    echo -e "${GREEN}✅ Git repository is ready locally!${NC}"
    echo ""
    echo -e "${CYAN}💡 To install GitHub CLI for easier future use:${NC}"
    echo "   Visit: https://cli.github.com"
fi

echo ""
echo "================================="
echo "🎯 Launch script complete!"
echo "================================="
