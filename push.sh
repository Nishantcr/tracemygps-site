#!/bin/bash
set -e
echo "One-click push: will push current folder to GitHub (force)."
read -p "Enter GitHub repo URL (https or ssh), e.g. https://github.com/YourUser/tracemygps-site.git : " repo
if [ -z "$repo" ]; then
  echo "Repo URL required. Exiting."
  exit 1
fi
git init
git add .
git commit -m "Initial static site build"
git remote remove origin 2>/dev/null || true
git remote add origin "$repo"
git branch -M main
git push -u origin main --force
echo "Pushed to $repo"
