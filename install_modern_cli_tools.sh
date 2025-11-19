#!/bin/bash

# ==========================================
# MODERN CLI TOOLS INSTALLATION
# ==========================================

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "ERROR: Homebrew is not found."
    echo "   Please install Homebrew first:"
    echo '   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
fi

echo "OK: Homebrew found. Updating..."
brew update

# The Optimized List (Redundancy removed)
TOOLS=(
    "eza"          # ls replacement
    "zoxide"       # cd replacement
    "bat"          # cat replacement
    "dust"         # du replacement
    "fd"           # find replacement
    "fzf"          # Fuzzy finder
    "atuin"        # History replacement
    "bottom"         # System monitor (top replacement)
    "ripgrep"      # grep replacement
    "fselect"      # SQL for files
    "grex"         # Regex generator
    "dysk"         # df replacement
    "fastfetch"    # System info
    "mdbook"       # Markdown docs
    "ouch"         # Compression
    "monolith"     # Web archiving
    "sd"           # sed replacement
    "watchexec"    # Watch runner
    "qsv"          # CSV utils
)

echo "Installing Core Tools via Homebrew..."

for tool in "${TOOLS[@]}"; do
    if brew list "$tool" &> /dev/null; then
        echo "   [OK] $tool is already installed."
    else
        echo "   Installing $tool..."
        brew install "$tool"
    fi
done

# Handle Special Cases (Tools sometimes named differently or best via other managers)

# 1. rnr (Rename)
if ! command -v rnr &> /dev/null; then
    echo "   Installing rnr..."
    brew install rnr 2>/dev/null || cargo install rnr 2>/dev/null || echo "      WARNING: Could not install rnr (requires cargo or brew tap)."
fi

# 2. xcp (Copy)
if ! command -v xcp &> /dev/null; then
    echo "   Installing xcp..."
    brew install xcp 2>/dev/null || cargo install xcp 2>/dev/null || echo "      WARNING: Could not install xcp."
fi

# 3. choose (Cut replacement)
if ! command -v choose &> /dev/null; then
    echo "   Installing choose..."
    # Homebrew often lists this as 'choose-rust' or 'choose-gui', trying generic first
    brew install choose-rust 2>/dev/null || brew install choose 2>/dev/null
fi

# 4. Shell-GPT (Python)
if ! command -v sgpt &> /dev/null; then
    echo "   Installing Shell-GPT (sgpt)..."
    if ! command -v pipx &> /dev/null; then
        brew install pipx
        pipx ensurepath
    fi
    pipx install shell-gpt
fi

echo "Installation complete!"
echo "   Run './setup_modern_cli_aliases.sh' to configure aliases."
