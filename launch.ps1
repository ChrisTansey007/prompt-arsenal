# Prompt Arsenal - Automated Launch Script (PowerShell)
# This script will initialize git, create GitHub repo, and push everything

Write-Host "🎯 Prompt Arsenal - Launch Script" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
Write-Host ""

# Repository details
$repoName = "prompt-arsenal"
$repoDescription = "Your comprehensive toolkit of powerful AI prompts, system configurations, and agent templates for ChatGPT, Claude, and AI coding tools"
$repoPath = "C:\Users\theca\CascadeProjects\prompt-arsenal"

# Navigate to repository directory
Write-Host "📁 Navigating to repository..." -ForegroundColor Yellow
Set-Location $repoPath

# Check if git is installed
Write-Host "🔍 Checking for git..." -ForegroundColor Yellow
$gitInstalled = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitInstalled) {
    Write-Host "❌ Git is not installed. Please install git first: https://git-scm.com/download/win" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Git found!" -ForegroundColor Green

# Check if gh CLI is installed
Write-Host "🔍 Checking for GitHub CLI..." -ForegroundColor Yellow
$ghInstalled = Get-Command gh -ErrorAction SilentlyContinue
if (-not $ghInstalled) {
    Write-Host "⚠️  GitHub CLI not found. Will provide manual instructions." -ForegroundColor Yellow
    $useManual = $true
} else {
    Write-Host "✅ GitHub CLI found!" -ForegroundColor Green
    $useManual = $false
}

# Initialize git repository
Write-Host ""
Write-Host "🎯 Initializing git repository..." -ForegroundColor Yellow
if (Test-Path ".git") {
    Write-Host "⚠️  Git already initialized, skipping..." -ForegroundColor Yellow
} else {
    git init
    Write-Host "✅ Git initialized!" -ForegroundColor Green
}

# Add all files
Write-Host ""
Write-Host "📦 Adding files to git..." -ForegroundColor Yellow
git add .
Write-Host "✅ Files added!" -ForegroundColor Green

# Create initial commit
Write-Host ""
Write-Host "💾 Creating initial commit..." -ForegroundColor Yellow
$commitMessage = @"
Initial commit: Prompt Arsenal - Your comprehensive AI prompts toolkit

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
- Vibe Coding
"@

git commit -m $commitMessage
Write-Host "✅ Initial commit created!" -ForegroundColor Green

# Create GitHub repository and push
Write-Host ""
if (-not $useManual) {
    Write-Host "🚀 Creating GitHub repository..." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Choose repository visibility:" -ForegroundColor Cyan
    Write-Host "1. Public (recommended)" -ForegroundColor White
    Write-Host "2. Private" -ForegroundColor White
    $visibility = Read-Host "Enter choice (1 or 2)"
    
    $isPublic = if ($visibility -eq "2") { $false } else { $true }
    $visibilityFlag = if ($isPublic) { "--public" } else { "--private" }
    
    Write-Host ""
    Write-Host "Creating repository on GitHub..." -ForegroundColor Yellow
    
    # Create the repository
    $createResult = gh repo create $repoName $visibilityFlag --source=. --remote=origin --description $repoDescription 2>&1
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ GitHub repository created!" -ForegroundColor Green
        
        # Set main branch
        Write-Host ""
        Write-Host "🔧 Setting main branch..." -ForegroundColor Yellow
        git branch -M main
        Write-Host "✅ Main branch set!" -ForegroundColor Green
        
        # Push to GitHub
        Write-Host ""
        Write-Host "📤 Pushing to GitHub..." -ForegroundColor Yellow
        git push -u origin main
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host ""
            Write-Host "🎉 SUCCESS! Repository launched!" -ForegroundColor Green
            Write-Host ""
            
            # Get repository URL
            $repoUrl = gh repo view --json url -q .url
            Write-Host "📍 Repository URL: $repoUrl" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "✨ Next Steps:" -ForegroundColor Yellow
            Write-Host "1. Visit your repository: $repoUrl" -ForegroundColor White
            Write-Host "2. Add topics in repository settings" -ForegroundColor White
            Write-Host "3. Enable Issues and Discussions" -ForegroundColor White
            Write-Host "4. Share on social media!" -ForegroundColor White
            Write-Host ""
            Write-Host "📋 Recommended Topics:" -ForegroundColor Yellow
            Write-Host "ai, prompts, chatgpt, claude, prompt-engineering, ai-agents," -ForegroundColor White
            Write-Host "cursor, windsurf, github-copilot, coding-tools, custom-agents" -ForegroundColor White
            
        } else {
            Write-Host "❌ Failed to push to GitHub" -ForegroundColor Red
            Write-Host "Run: git push -u origin main" -ForegroundColor Yellow
        }
    } else {
        Write-Host "❌ Failed to create GitHub repository" -ForegroundColor Red
        Write-Host "Error: $createResult" -ForegroundColor Red
        Write-Host ""
        Write-Host "Please create manually at: https://github.com/new" -ForegroundColor Yellow
    }
    
} else {
    # Manual instructions
    Write-Host "📋 Manual Setup Required" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "GitHub CLI is not installed. Please complete these steps:" -ForegroundColor White
    Write-Host ""
    Write-Host "1. Create repository on GitHub:" -ForegroundColor Cyan
    Write-Host "   - Go to: https://github.com/new" -ForegroundColor White
    Write-Host "   - Name: prompt-arsenal" -ForegroundColor White
    Write-Host "   - Description: $repoDescription" -ForegroundColor White
    Write-Host "   - Choose: Public" -ForegroundColor White
    Write-Host "   - DO NOT initialize with README, .gitignore, or license" -ForegroundColor White
    Write-Host ""
    Write-Host "2. After creating, run these commands:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   git remote add origin https://github.com/YOUR-USERNAME/prompt-arsenal.git" -ForegroundColor Yellow
    Write-Host "   git branch -M main" -ForegroundColor Yellow
    Write-Host "   git push -u origin main" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "✅ Git repository is ready locally!" -ForegroundColor Green
    Write-Host ""
    Write-Host "💡 To install GitHub CLI for easier future use:" -ForegroundColor Cyan
    Write-Host "   winget install --id GitHub.cli" -ForegroundColor Yellow
    Write-Host "   or visit: https://cli.github.com" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=================================" -ForegroundColor Cyan
Write-Host "🎯 Launch script complete!" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
