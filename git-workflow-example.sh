#!/usr/bin/env bash
# Task 2
# Purpose: Demonstrate Git as a DVCS for version control in software development
# Usage:   bash git-workflow-example.sh [remote-url]
#          e.g. bash git-workflow-example.sh https://github.com/<username>/book-list-manager.git
#          Without a remote URL, the push steps are skipped and everything runs locally.

set -euo pipefail

REMOTE_URL="${1:-}"

# -----------------------------
# Step 1: Initialize a Git repository
# -----------------------------
mkdir -p book-list-manager
cd book-list-manager
git init  # Initializes an empty Git repository

# -----------------------------
# Step 2: Configure Git
# Repository-level config, so your global settings are not changed.
# For a one-time global setup use: git config --global user.name "Your Name"
# -----------------------------
git config user.name "Your Name"
git config user.email "your.email@example.com"

# -----------------------------
# Step 3: Create sample project files
# -----------------------------
echo "# Book List App" > README.md
echo "console.log('Book list initialized.');" > app.js

# -----------------------------
# Step 4: Stage files for commit
# -----------------------------
git add README.md app.js  # Adds files to the staging area

# -----------------------------
# Step 5: Commit the staged files
# -----------------------------
git commit -m "Initial commit: Add README and app.js"
git branch -M main

# -----------------------------
# Step 6: Connect a remote GitHub repository and push
# (the repository must already exist on GitHub)
# -----------------------------
if [ -n "$REMOTE_URL" ]; then
  git remote add origin "$REMOTE_URL"
  git push -u origin main
fi

# -----------------------------
# Step 7: Make changes and track versions
# -----------------------------
echo "console.log('Updated with book management functions.');" >> app.js
git add app.js
git commit -m "Add book management logging"
if [ -n "$REMOTE_URL" ]; then
  git push
fi

# -----------------------------
# Step 8: Inspect repository history and objects
# -----------------------------
git log --oneline  # Shows commit history
git show HEAD      # Shows latest commit details

# View internal Git objects
# Each commit points to a tree, and the tree points to blobs (file contents)
git cat-file -p HEAD             # Commit object: tree hash, parent, author, message
git cat-file -p 'HEAD^{tree}'    # Tree object: files and folders in the commit
git cat-file -p HEAD:README.md   # Blob object: contents of a specific file

# -----------------------------
# Git Object Types (simplified)
# -----------------------------
# - blob:   stores file data (e.g., code, README)
# - tree:   stores directory structure and points to blobs
# - commit: snapshot that references a tree, parent commit, author, etc.

# End of script
