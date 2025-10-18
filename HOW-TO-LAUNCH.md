# 🚀 How to Launch prompt-arsenal

Two automated scripts are available to launch your repository to GitHub!

---

## ✨ Automated Launch (Recommended)

### Option 1: PowerShell (Windows) - EASIEST

1. **Open PowerShell** in the repository folder:
   ```
   Right-click on the prompt-arsenal folder
   → "Open in Terminal" or "Open PowerShell here"
   ```

2. **Run the launch script:**
   ```powershell
   .\launch.ps1
   ```

3. **Follow the prompts:**
   - Script will check for Git and GitHub CLI
   - Initialize Git repository
   - Create initial commit
   - Create GitHub repository (if GitHub CLI installed)
   - Push to GitHub

### Option 2: Bash (Mac/Linux or Git Bash on Windows)

1. **Make script executable:**
   ```bash
   chmod +x launch.sh
   ```

2. **Run the script:**
   ```bash
   ./launch.sh
   ```

---

## 📋 What the Script Does

1. ✅ Checks if Git is installed
2. ✅ Checks if GitHub CLI is installed
3. ✅ Initializes Git repository
4. ✅ Adds all files
5. ✅ Creates initial commit with detailed message
6. ✅ Creates GitHub repository (if CLI available)
7. ✅ Pushes to GitHub
8. ✅ Provides next steps

---

## 🔧 Prerequisites

### Required:
- **Git** - Install from https://git-scm.com/download/win

### Optional (but recommended):
- **GitHub CLI** - Makes everything automatic!
  
  **Install via:**
  ```powershell
  # Windows (using winget)
  winget install --id GitHub.cli
  
  # Or download from: https://cli.github.com
  ```
  
  **After installing, authenticate:**
  ```bash
  gh auth login
  ```

---

## 🎯 Two Scenarios

### Scenario A: GitHub CLI Installed ✨
**Fully Automated!**
- Script creates GitHub repo for you
- Automatically connects and pushes
- Done in one command!

### Scenario B: No GitHub CLI ⚙️
**Semi-Automated:**
- Script prepares everything locally
- You create repo manually on GitHub
- Script provides exact commands to run

---

## 📖 Manual Launch (If Scripts Don't Work)

If you prefer or need to do it manually:

1. **Initialize Git:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Prompt Arsenal"
   ```

2. **Create on GitHub:**
   - Go to https://github.com/new
   - Name: `prompt-arsenal`
   - Public
   - Don't initialize

3. **Connect and push:**
   ```bash
   git remote add origin https://github.com/YOUR-USERNAME/prompt-arsenal.git
   git branch -M main
   git push -u origin main
   ```

---

## ⚠️ Troubleshooting

### "Cannot run scripts" (PowerShell)
Your execution policy might block scripts. Run:
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\launch.ps1
```

### "Permission denied" (Bash)
Make the script executable:
```bash
chmod +x launch.sh
./launch.sh
```

### "gh: command not found"
GitHub CLI is not installed. Install it or use manual method.

### "Git is not installed"
Install Git from https://git-scm.com

### "remote already exists"
If you've already run the script:
```bash
git remote remove origin
# Then run the script again
```

---

## ✅ After Launch Checklist

Once your repository is on GitHub:

### 1. **Add Topics** (Important for Discovery!)
Go to your repo → Click gear icon next to "About"

Add these topics:
```
ai, prompts, chatgpt, claude, prompt-engineering, 
ai-agents, cursor, windsurf, github-copilot, 
coding-tools, custom-agents, prompts-collection
```

### 2. **Enable Features**
Repository Settings:
- ✅ Enable Issues
- ✅ Enable Discussions (optional)
- ✅ Enable Wiki (optional)

### 3. **Share!**
- Tweet/post about it
- Add to your website
- Share in communities
- Tell your audience

---

## 🎉 You're Done!

Your repository is now live and ready to:
- Accept contributions
- Get stars and forks
- Build a community
- Help others with AI prompts

---

## 📞 Need Help?

**Common Questions:**

**Q: Do I need GitHub CLI?**
A: No, but it makes everything easier. The script works either way.

**Q: Can I make it private?**
A: Yes! The script asks for visibility preference.

**Q: What if I mess up?**
A: You can delete the repo on GitHub and run the script again.

**Q: Can I run this multiple times?**
A: The script checks if Git is already initialized and skips if needed.

---

**Ready? Run `.\launch.ps1` and let's go! 🚀**
