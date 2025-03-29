#!/bin/bash

WATCHED_DIR="./"

echo "Monitoring directory: $WATCHED_DIR for changes..."

while true; do
    # Check for modified or untracked files
    if git status --porcelain | grep -q "^\s*M\|^\?\?"; then
        echo "Detected file changes. Committing and pushing..."
        
        # Add all changes
        git add .
        
        # Commit changes with timestamp
        git commit -m "Auto-commit: $(date +"%Y-%m-%d %H:%M:%S")"
        
        # Push changes to GitHub
        git push origin master
        
        echo "Changes pushed successfully!"
    fi
    
    sleep 5  # Check every 5 seconds for new changes
done
