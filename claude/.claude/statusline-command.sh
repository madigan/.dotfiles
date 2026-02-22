#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract current directory from input
cwd=$(echo "$input" | jq -r '.workspace.current_dir')

# Get the directory name (like Starship's directory module)
if [ "$cwd" = "$HOME" ]; then
    dir_display="~"
else
    dir_display=$(basename "$cwd")
fi

# Build status line components
status_parts=()

# Directory (in cyan)
status_parts+=("$(printf '\033[36m%s\033[0m' "$dir_display")")

# Git branch and status (if in a git repo)
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git -C "$cwd" branch --show-current 2>/dev/null || echo "detached")

    # Check git status (with --no-optional-locks to avoid lock issues)
    git_status=$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)

    # Determine status indicator
    if [ -n "$git_status" ]; then
        # Has changes - show in yellow with indicator
        status_parts+=("$(printf '\033[33mon\033[0m')")
        status_parts+=("$(printf '\033[33m%s\033[0m' "[$branch]")")
    else
        # Clean - show in green
        status_parts+=("$(printf '\033[32mon\033[0m')")
        status_parts+=("$(printf '\033[32m%s\033[0m' "[$branch]")")
    fi
fi

# Node.js version (if package.json exists)
if [ -f "$cwd/package.json" ]; then
    node_version=$(node --version 2>/dev/null | sed 's/v//')
    if [ -n "$node_version" ]; then
        status_parts+=("$(printf '\033[32mvia\033[0m')")
        status_parts+=("$(printf '\033[32m⬢ %s\033[0m' "$node_version")")
    fi
fi

# Python version (if requirements.txt or pyproject.toml exists)
if [ -f "$cwd/requirements.txt" ] || [ -f "$cwd/pyproject.toml" ]; then
    python_version=$(python3 --version 2>/dev/null | awk '{print $2}')
    if [ -n "$python_version" ]; then
        status_parts+=("$(printf '\033[33mvia\033[0m')")
        status_parts+=("$(printf '\033[33m🐍 %s\033[0m' "$python_version")")
    fi
fi

# Join all parts with spaces
IFS=' '
echo "${status_parts[*]}"
