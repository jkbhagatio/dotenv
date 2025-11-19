# Modern CLI Tools Setup

A collection of shell scripts to install and configure modern command-line tools that replace traditional Unix utilities with faster, more feature-rich alternatives.

## What's Included

### Core Tools Installed
- **eza** - Modern replacement for `ls` with icons and git integration
- **zoxide** - Smarter `cd` command with fuzzy matching
- **bat** - `cat` replacement with syntax highlighting
- **dust** - `du` replacement with better visualization
- **fd** - `find` replacement, faster and more intuitive
- **fzf** - Fuzzy finder for files and command history
- **atuin** - Enhanced shell history with full-text search
- **bottom** - `top`/`htop` replacement written in Rust
- **ripgrep** - `grep` replacement, extremely fast
- **fselect** - SQL-like queries for files
- **grex** - Regex generator from examples
- **dysk** - `df` replacement with better formatting
- **fastfetch** - System information display
- **mdbook** - Create books from Markdown files
- **ouch** - Unified compression/decompression tool
- **monolith** - Save web pages as single HTML files
- **sd** - `sed` replacement for simple find-replace
- **watchexec** - Execute commands when files change
- **qsv** - CSV processing toolkit

### Special Tools
- **rnr** - Bulk file renaming
- **xcp** - `cp` replacement with progress bars
- **choose** - `cut` replacement with better field selection
- **Shell-GPT** - AI-powered shell assistant

## Installation

### Prerequisites
- **Homebrew** must be installed on macOS/Linux
- **Cargo** (Rust) for some tools as fallback

### Quick Setup

1. **Install tools:**
   ```bash
   ./install_modern_cli_tools.sh
   ```

2. **Configure aliases:**
   ```bash
   ./setup_modern_cli_aliases.sh
   ```

3. **Restart your terminal** or source your shell config:
   ```bash
   source ~/.zshrc  # or ~/.bashrc
   ```

## Aliases Configured

After setup, these aliases will be available:

- `ls` → `eza --icons`
- `ll` → `eza -l --icons --git -a`
- `cat` → `bat`
- `grep` → `ripgrep`
- `find` → `fd`
- `du` → `dust`
- `df` → `dysk`
- `top` → `bottom`
- `cp` → `xcp`
- `ask` → `sgpt` (AI chat)
- `s` → `sgpt --shell` (AI shell command generation)
- `sys` → `fastfetch`

## Requirements

- macOS or Linux
- Homebrew package manager
- Bash or Zsh shell

## License

MIT License - see LICENSE file for details.
