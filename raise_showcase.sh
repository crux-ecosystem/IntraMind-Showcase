#!/bin/bash
# ============================================================
# 🚀 IntraMind Public Showcase - GitHub Push Script
# ============================================================
# Run this in your native terminal (NOT VS Code's Flatpak terminal):
#
#   cd ~/Downloads/IntraMind/public-showcase
#   bash raise_showcase.sh
#
# Prerequisites:
#   - Git configured with your GitHub credentials
#   - GitHub repo created: crux-ecosystem/IntraMind-Showcase
# ============================================================

set -e

SHOWCASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SHOWCASE_DIR"

echo ""
echo "============================================================"
echo "🧠 IntraMind Public Showcase - Raise to GitHub"
echo "============================================================"
echo ""

# ──────────────────────────────────────────────────────────
# STEP 1: Verify we're in the right directory
# ──────────────────────────────────────────────────────────
echo "[1/6] Verifying directory..."
if [ ! -f "README.md" ] || [ ! -f "LICENSE" ]; then
    echo "❌ ERROR: Not in the public-showcase directory!"
    echo "   cd ~/Downloads/IntraMind/public-showcase"
    exit 1
fi
echo "✅ In public-showcase directory: $SHOWCASE_DIR"

# ──────────────────────────────────────────────────────────
# STEP 2: Configure git for Linux
# ──────────────────────────────────────────────────────────
echo ""
echo "[2/6] Configuring git for Linux..."
git config core.filemode true
git config core.symlinks true
git config core.ignorecase false
git config core.autocrlf input

# Check if user identity is set
if ! git config user.name > /dev/null 2>&1; then
    echo ""
    read -p "Enter your Git name (e.g., Mounesh Kodi): " git_name
    git config user.name "$git_name"
fi
if ! git config user.email > /dev/null 2>&1; then
    echo ""
    read -p "Enter your Git email: " git_email
    git config user.email "$git_email"
fi
echo "✅ Git configured for Linux"
echo "   Name:  $(git config user.name)"
echo "   Email: $(git config user.email)"

# ──────────────────────────────────────────────────────────
# STEP 3: Check remote
# ──────────────────────────────────────────────────────────
echo ""
echo "[3/6] Checking remote..."
REMOTE_URL=$(git remote get-url origin 2>/dev/null || echo "NONE")
if [ "$REMOTE_URL" = "NONE" ]; then
    echo "⚠️  No remote set. Adding origin..."
    read -p "Enter GitHub repo URL (e.g., https://github.com/crux-ecosystem/IntraMind-Showcase.git): " repo_url
    git remote add origin "$repo_url"
    REMOTE_URL="$repo_url"
fi
echo "✅ Remote: $REMOTE_URL"

# ──────────────────────────────────────────────────────────
# STEP 4: Show what will be pushed
# ──────────────────────────────────────────────────────────
echo ""
echo "[4/6] Files to be committed:"
echo "──────────────────────────────────────────"
git status --short
echo "──────────────────────────────────────────"
echo ""

# Count tracked files
TRACKED=$(git ls-files | wc -l)
UNTRACKED=$(git ls-files --others --exclude-standard | wc -l)
echo "   Tracked files:   $TRACKED"
echo "   New files:       $UNTRACKED"

# ──────────────────────────────────────────────────────────
# STEP 5: Stage and commit
# ──────────────────────────────────────────────────────────
echo ""
echo "[5/6] Staging and committing..."

# Check if there are changes to commit
if [ -n "$(git status --porcelain)" ]; then
    git add -A
    
    echo ""
    echo "Commit message (press Enter for default):"
    read -p "> " commit_msg
    
    if [ -z "$commit_msg" ]; then
        commit_msg="feat: IntraMind v1.1 Public Showcase - Linux ready

🧠 IntraMind Offline-First AI Knowledge Base
- Professional README with architecture & benchmarks
- CC BY-NC 4.0 license with proprietary protection
- Demo API endpoints (simulated FastAPI)
- Architecture documentation
- Security validation GitHub Actions
- Screenshots & showcase materials
- Linux (Pop!_OS/Ubuntu) compatible"
    fi
    
    git commit -m "$commit_msg"
    echo "✅ Changes committed"
else
    echo "✅ No new changes to commit (already up to date)"
fi

# ──────────────────────────────────────────────────────────
# STEP 6: Push to GitHub
# ──────────────────────────────────────────────────────────
echo ""
echo "[6/6] Pushing to GitHub..."
echo ""
read -p "Push to $REMOTE_URL on branch 'main'? (y/n): " confirm

if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
    git push -u origin main
    echo ""
    echo "============================================================"
    echo "🎉 SUCCESS! IntraMind Public Showcase is LIVE!"
    echo "============================================================"
    echo ""
    echo "🌐 View at: ${REMOTE_URL%.git}"
    echo ""
    echo "Next steps:"
    echo "  1. Visit your repo on GitHub"
    echo "  2. Go to Settings → Pages → Enable GitHub Pages"
    echo "  3. Share the link on LinkedIn! 🚀"
    echo ""
else
    echo ""
    echo "Push cancelled. Your commit is saved locally."
    echo "When ready, run: git push -u origin main"
fi
