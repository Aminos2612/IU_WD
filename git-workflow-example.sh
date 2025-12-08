# Task 2
# Purpose: Demonstrate Git as a DVCS for version control in software development
# Usage: Run these commands in a terminal with Git installed

# -----------------------------
# Step 1: Configure Git (One-time setup)
# -----------------------------
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# -----------------------------
# Step 2: Initialize a Git repository
# -----------------------------
mkdir book-list-manager
cd book-list-manager
git init  # Initializes an empty Git repository

# -----------------------------
# Step 3: Create sample project files
# -----------------------------
echo "# Book List App" > README.md
echo "console.log('Book list initialized.');" > app.js

# -----------------------------
# Step 4: Stage files for commit
# -----------------------------
git add README.md app.js  # Adds files to staging area

# -----------------------------
# Step 5: Commit the staged files
# -----------------------------
git commit -m "Initial commit: Add README and app.js"

# -----------------------------
# Step 6: Create a remote GitHub repo and push (Assuming already created)
# Replace <username> and <repo> accordingly
# -----------------------------
git remote add origin https://github.com/<username>/book-list-manager.git
git branch -M main
git push -u origin main

# -----------------------------
# Step 7: Make changes and track versions
# -----------------------------
echo "console.log('Updated with book management functions.');" >> app.js
git add app.js
git commit -m "Add book management logging"
git push

# -----------------------------
# Step 8: Inspect repository history and objects
# -----------------------------
git log  # Shows commit history
git show HEAD  # Shows latest commit details

# View internal Git objects
# Each commit points to a tree of blobs (file contents)
git cat-file -p HEAD  # View tree hash
git cat-file -p <tree_hash>  # View structure of files and folders
git cat-file -p <blob_hash>  # View contents of a specific file

# -----------------------------
# Git Object Types (simplified)
# -----------------------------
# - blob: stores file data (e.g., code, README)
# - tree: stores directory structure and points to blobs
# - commit: snapshot that references a tree, parent commit, author, etc.

# End of script
