#!/bin/bash

# Set the GitHub repository URL
REPO_URL="git@github.com:valehasadli/twitter-stream.git"

# Set the folder name to push
FOLDER_NAME="microservices-demo"

# Check if the folder exists
if [[ ! -d "$FOLDER_NAME" ]]; then
  echo "Error: $FOLDER_NAME folder not found."
  exit 1
fi

# Navigate to the target folder
cd "$FOLDER_NAME"

# Initialize Git if it's not already initialized
if [[ ! -d ".git" ]]; then
  echo "Initializing Git repository..."
  git init
  git remote add origin "$REPO_URL"
fi

# Create the .gitignore file if it doesn't exist
if [[ ! -f ".gitignore" ]]; then
  echo ".idea" >> .gitignore
fi

# Add all files to the repository, excluding the .idea folder
git add -A -- . ':!.idea'

# Commit the changes
git commit -m "Update project"

# Force push the changes to GitHub
git push -u origin master --force
