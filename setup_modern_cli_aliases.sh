#!/bin/bash

# ==========================================
# MODERN CLI TOOLS ALIASES & CONFIGURATION
# ==========================================

# Detect Shell
SHELL_CONFIG=""
if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    # Fallback detection based on $SHELL env var
    if [[ "$SHELL" == */zsh ]]; then
        SHELL_CONFIG="$HOME/.zshrc"
    elif [[ "$SHELL" == */bash ]]; then
        SHELL_CONFIG="$HOME/.bashrc"
    fi
fi

if [ -z "$SHELL_CONFIG" ]; then
    echo "WARNING: Could not detect .zshrc or .bashrc. Skipping alias setup."
    exit 1
fi

echo "Configuring aliases in $SHELL_CONFIG..."

# Define the block of aliases to append
read -r -d '' ALIAS_BLOCK << EOM

# --- MODERN CLI TOOLS CONFIG ---
# Added by setup script

# 1. Init Scripts (Required for zoxide/atuin to work)
eval "\$(zoxide init $(basename "$SHELL"))"
eval "\$(atuin init $(basename "$SHELL"))"

# 2. Core Utils Replacements
EOM

# Check each tool and add aliases conditionally
if command -v eza &> /dev/null; then
    ALIAS_BLOCK+=$'\nalias ls="eza --icons"                   # Use eza with icons'
    ALIAS_BLOCK+=$'\nalias ll="eza -l --icons --git -a"       # Long list, git status, all files'
else
    echo "   WARNING: eza not found. Skipping ls/ll aliases."
fi

if command -v bat &> /dev/null; then
    ALIAS_BLOCK+=$'\nalias cat="bat"                          # Use bat instead of cat'
else
    echo "   WARNING: bat not found. Skipping cat alias."
fi

if command -v rg &> /dev/null; then
    ALIAS_BLOCK+=$'\nalias grep="rg"                          # Use ripgrep instead of grep'
else
    echo "   WARNING: ripgrep (rg) not found. Skipping grep alias."
fi

if command -v fd &> /dev/null; then
    ALIAS_BLOCK+=$'\nalias find="fd"                          # Use fd instead of find'
else
    echo "   WARNING: fd not found. Skipping find alias."
fi

if command -v dust &> /dev/null; then
    ALIAS_BLOCK+=$'\nalias du="dust"                          # Use dust for disk usage'
else
    echo "   WARNING: dust not found. Skipping du alias."
fi

if command -v dysk &> /dev/null; then
    ALIAS_BLOCK+=$'\nalias df="dysk"                          # Use dysk for disk free'
else
    echo "   WARNING: dysk not found. Skipping df alias."
fi

if command -v btm &> /dev/null; then
    ALIAS_BLOCK+=$'\nalias top="btm"                          # Use btm instead of 'top'
else
    echo "   WARNING: bottom not found. Skipping top alias."
fi

if command -v xcp &> /dev/null; then
    ALIAS_BLOCK+=$'\nalias cp="xcp"                           # Use xcp for copying (progress bars)'
else
    echo "   WARNING: xcp not found. Skipping cp alias."
fi

if command -v fastfetch &> /dev/null; then
    ALIAS_BLOCK+=$'\nalias sys="fastfetch"                    # System Info'
else
    echo "   WARNING: fastfetch not found. Skipping sys alias."
fi

ALIAS_BLOCK+=$'\n\n# --- END MODERN CLI TOOLS ---'

echo "$ALIAS_BLOCK" >> "$SHELL_CONFIG"
echo "   Aliases and Init scripts appended to $SHELL_CONFIG"

echo "-----------------------------------------------------"
echo "DONE!"
echo "   Please restart your terminal or run the following command to apply changes immediately:"
echo "   source $SHELL_CONFIG"
