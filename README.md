# dotenv

Files for setting up an OS env.

---

## Modern CLI Tools Setup

`install_modern_cli_tools.sh` and `setup_modern_cli_aliases.sh`.

Shell scripts to install and configure modern command-line tools that replace traditional Linux utilities with faster, more feature-rich alternatives.

### Prerequisites

- **OS**: macOS or Linux
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

### Tools Installed

- **sgpt**: An AI command-line interface that allows you to chat with LLMs (like OpenAI) directly in your terminal; it enables you to generate shell commands, write code snippets, and debug errors without leaving your shell.
- **eza**: A modern, feature-rich replacement for `ls` that lists directory contents with color-coded file types, icons, and Git integration (showing file status dots), making file navigation significantly more visual and informative.
- **zoxide**: A smarter, faster alternative to `cd` that learns your most frequently used directories; it lets you jump instantly to any folder (e.g., `z proj`) without typing the full path, based on your usage history.
- **bat**: A "cat clone with wings" that displays file contents with syntax highlighting, line numbers, and Git modification markers, making code and config files much easier to read than standard `cat`.
- **dust**: A more intuitive replacement for `du` that visualizes disk usage as a graphical tree structure, helping you instantly identify which specific folders are consuming the most space on your drive.
- **fd**: A simple, fast alternative to `find` that simplifies searching for files by auto-ignoring hidden files and `.gitignore` patterns, and using a colorized, user-friendly output format.
- **fzf**: A general-purpose "fuzzy finder" that lets you interactively filter and select items from any list (like files, command history, or processes) by typing approximate search terms.
- **atuin**: A replacement for your existing shell history that stores commands in a searchable database; it allows you to sync history across machines and filter past commands by directory, time, or exit status.
- **bottom**: A polished, visually rich alternative to `top` and `htop` that monitors system resources (CPU, memory, network, disk) with a responsive graphical UI and mouse support.
- **ripgrep**: A line-oriented search tool that replaces `grep`; it is incredibly fast and respects your `.gitignore` rules automatically, making it the gold standard for searching text within codebases.
- **fselect**: A unique file-finding tool that allows you to query your filesystem using SQL-like syntax (e.g., `select name from . where size > 1gb`), offering a powerful alternative to complex `find` flags.
- **grex**: A helper tool that automatically generates a single regular expression (regex) capable of matching a specific set of test cases or strings you provide as input.
- **dysk**: A modern replacement for `df` (disk free) that displays information about your mounted filesystems and disks in a clean, tabular format with better handling of complex mount points.
- **fastfetch**: A highly customizable system information script (replacing `neofetch` and `macchina`) that rapidly displays your OS details, kernel version, and hardware specs with ASCII art.
- **mdbook**: A utility primarily used by the Rust community to generate professional-grade online books and documentation sites from simple Markdown files.
- **ouch**: A unified compression tool that replaces `tar`, `zip`, and `unzip` with a single, intuitive command that automatically detects file types based on extensions for easy compression and decompression.
- **monolith**: A web archiving tool that bundles any web page URL into a single, standalone HTML file, embedding all CSS, images, and JavaScript so the page can be viewed offline exactly as it appeared.
- **sd**: A modern replacement for `sed` that focuses on finding and replacing text; it offers a much simpler syntax and significantly faster performance for standard string substitution tasks.
- **watchexec**: A robust task runner that watches specific files or directories for changes and automatically executes a defined command whenever a modification is detected.
- **qsv**: A high-performance toolkit (formerly `xsv`) designed for indexing, slicing, querying, and manipulating massive CSV data files rapidly from the command line.
- **rnr**: A safe batch file renaming tool that supports regular expressions and lets you preview changes before applying them, replacing risky loops or complex `mv` commands.
- **xcp**: A modern replacement for `cp` (copy) that displays a progress bar during file transfers and provides clearer, more understandable error messages.
- **choose**: A human-friendly alternative to `cut` and `awk` that lets you select text fields from output using intuitive Python-like list slicing (e.g., `choose 1:-1` to grab everything but the first and last columns).

### Aliases Configured

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
