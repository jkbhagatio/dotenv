# Modern CLI Tools Cheatsheet

A quick reference for every tool installed by `install_modern_cli_tools.sh`.

---

## atuin — Shell History Replacement

Replaces the default shell history with a searchable, synced database.

**When to use:** Searching through command history, syncing history across machines.

```bash
atuin search <query>          # Search history for a string
atuin search --exit 0         # Show only successful commands
atuin search --after "1h"     # Commands from the last hour
atuin history list             # List recent history
atuin import auto              # Import existing shell history
atuin sync                     # Sync history across machines
```

---

## bat — cat Replacement

A `cat` clone with syntax highlighting, line numbers, and git integration.

**When to use:** Reading files in the terminal when you want syntax highlighting and paging.

```bash
bat file.py                    # Display file with syntax highlighting
bat -n file.py                 # Show line numbers only (no other decorations)
bat -p file.py                 # Plain output (no decorations at all)
bat -l json data.txt           # Force a specific language for highlighting
bat -r 10:20 file.py           # Show only lines 10-20
bat --diff file.py             # Show git diff markers alongside content
bat -A file.txt                # Show non-printable characters
bat file1.py file2.py          # Concatenate and display multiple files
```

---

## bottom (btm) — System Monitor (top Replacement)

A graphical process/system monitor for the terminal.

**When to use:** Monitoring CPU, memory, network, disk, and process usage interactively.

```bash
btm                            # Launch interactive system monitor
btm --basic                    # Minimal mode without graphs
btm -t                         # Use default terminal colors
btm --process_command          # Show full command instead of process name
btm -r 500                     # Set refresh rate to 500ms
```

**Interactive keys:** `q` quit, `/` search processes, `dd` kill process, `Tab` cycle widgets.

---

## choose — cut Replacement

A simpler, more intuitive alternative to `cut` and `awk` for field selection.

**When to use:** Extracting columns or fields from text output.

```bash
echo "one two three" | choose 1           # Print 2nd field ("two", 0-indexed)
echo "one two three" | choose 0 2         # Print 1st and 3rd fields
echo "a:b:c" | choose -f ':' 1            # Use ':' as delimiter
echo "one two three" | choose 1:          # Print from 2nd field to end
ls -l | choose 4                           # Extract file sizes from ls output
```

---

## dust — du Replacement

A more intuitive disk usage analyzer with a visual tree.

**When to use:** Finding what's consuming disk space in a directory.

```bash
dust                           # Show disk usage of current directory
dust /path/to/dir              # Analyze a specific directory
dust -r                        # Reverse sort (smallest first)
dust -n 10                     # Show only the top 10 entries
dust -d 2                      # Limit tree depth to 2 levels
dust -X .git                   # Exclude .git directory
dust -s                        # Use apparent size instead of disk usage
```

---

## dysk — df Replacement

A better `df` with readable output and filesystem details.

**When to use:** Checking disk space and mounted filesystem information.

```bash
dysk                           # Show all mounted filesystems
dysk /home                     # Show info for a specific mount point
dysk -s free                   # Sort by free space
dysk -f used,free,disk         # Show only specific columns
```

---

## eza — ls Replacement

A modern replacement for `ls` with colors, icons, and git integration.

**When to use:** Listing directory contents with better formatting.

```bash
eza                            # List files (colored)
eza --icons                    # List with file-type icons
eza -l --git                   # Long listing with git status
eza -la                        # Long listing including hidden files
eza -T                         # Tree view
eza -T -L 2                   # Tree view, 2 levels deep
eza -l --sort=size             # Sort by file size
eza -l --sort=modified         # Sort by modification time
eza --group-directories-first  # Directories first
```

---

## fastfetch — System Info

Displays system information in a visually appealing format (like neofetch, but faster).

**When to use:** Quickly viewing system specs (OS, kernel, CPU, memory, etc.).

```bash
fastfetch                      # Show system info with logo
fastfetch -c small             # Use a compact preset
fastfetch --logo none          # Hide the ASCII logo
fastfetch -s os:kernel:cpu:memory  # Show only specific modules
```

---

## fcp — cp Replacement

A fast file copy tool with progress bars.

**When to use:** Copying large files or directories when you want progress feedback.

```bash
fcp source.bin dest.bin        # Copy a file
fcp -r src_dir/ dest_dir/      # Copy a directory recursively
```

---

## fd — find Replacement

A fast, user-friendly alternative to `find`.

**When to use:** Searching for files and directories by name or pattern.

```bash
fd pattern                     # Find files matching pattern (recursive)
fd -e py                       # Find all .py files
fd -e py -x wc -l              # Find .py files and count lines in each
fd -H pattern                  # Include hidden files in search
fd -t d src                    # Find only directories named "src"
fd -t f -s 'README'            # Case-sensitive search for files
fd -E node_modules pattern     # Exclude a directory
fd pattern /path/to/search     # Search in a specific directory
fd -g '*.test.js'              # Use glob pattern instead of regex
```

---

## fselect — SQL for Files

Query files using SQL-like syntax.

**When to use:** Complex file searches using SQL expressions (filter by size, date, permissions, etc.).

```bash
fselect name, size from .                           # List file names and sizes
fselect name from . where size > 1m                 # Files larger than 1MB
fselect name, modified from . where name = '*.rs'   # Rust files with dates
fselect "name, size from . where modified > '2025-01-01' order by size desc"
fselect name from . where is_dir = true             # Only directories
fselect "name, line_count from . where name = '*.py' order by line_count desc"
```

---

## fzf — Fuzzy Finder

A general-purpose fuzzy finder for the command line.

**When to use:** Interactively filtering and selecting from any list (files, history, branches, etc.).

```bash
fzf                            # Fuzzy-find files in current directory
cat file.txt | fzf             # Fuzzy-filter lines from any input
fzf --preview 'bat --color=always {}'   # File finder with preview
git branch | fzf               # Interactively select a git branch
history | fzf                  # Search command history
fd -e py | fzf --multi         # Select multiple Python files
kill -9 $(ps aux | fzf | awk '{print $2}')   # Fuzzy-select a process to kill
```

**Interactive keys:** `Ctrl-j/k` move up/down, `Tab` toggle selection (multi), `Enter` confirm.

---

## grex — Regex Generator

Generates regular expressions from provided test strings.

**When to use:** Building a regex that matches a set of example strings.

```bash
grex foo bar baz               # Generate regex matching all three strings
grex -d foo123 bar456          # Generate regex with digit placeholders
grex -w foo bar                # Generate regex with word boundaries
grex -r foo bar                # Generate a more readable (verbose) regex
grex -e '^start' 'end$'       # Escape special regex characters in input
```

---

## macchina — System Info Fetcher

A fast system information frontend with customizable themes.

**When to use:** Displaying a quick summary of system info (similar to fastfetch/neofetch).

```bash
macchina                       # Display system info
macchina -t Hydrogen           # Use a specific theme
macchina -d                    # Show all available data points
macchina -l                    # List available themes
macchina -c key1,key2          # Show only specific info fields
```

---

## mdbook — Markdown Documentation

Creates books from Markdown files (like Rust's official docs).

**When to use:** Building documentation sites or books from Markdown.

```bash
mdbook init my-book            # Create a new book project
mdbook build                   # Build the book to HTML
mdbook serve                   # Build and serve locally with live reload
mdbook serve -p 8080           # Serve on a custom port
mdbook test                    # Test Rust code examples in the book
mdbook clean                   # Remove build artifacts
```

---

## monolith — Web Archiving

Saves complete web pages as a single HTML file with all assets embedded.

**When to use:** Archiving a web page for offline reading with images, CSS, and JS intact.

```bash
monolith https://example.com -o page.html       # Save page as single HTML file
monolith -I https://example.com -o page.html    # Exclude images
monolith -j https://example.com -o page.html    # Exclude JavaScript
monolith -s https://example.com -o page.html    # Silent mode (no progress)
monolith -e -o page.html https://example.com    # Ignore network errors
```

---

## ouch — Compression/Decompression

A unified tool for compressing and decompressing files (handles tar, zip, gz, bz2, xz, zstd, etc.).

**When to use:** Compressing or extracting archives without remembering format-specific flags.

```bash
ouch decompress archive.tar.gz       # Extract (auto-detects format)
ouch decompress archive.zip          # Works with any supported format
ouch compress file1 file2 out.zip    # Compress files into a zip
ouch compress dir/ out.tar.gz        # Compress directory into tar.gz
ouch list archive.tar.gz             # List contents without extracting
```

---

## qsv — CSV Utilities

A fast CSV toolkit for querying, transforming, and analyzing CSV files.

**When to use:** Working with CSV data — filtering rows, selecting columns, computing stats.

```bash
qsv headers data.csv                  # Show column names
qsv stats data.csv                    # Summary statistics for each column
qsv select name,age data.csv          # Select specific columns
qsv search "pattern" data.csv         # Search rows matching a regex
qsv sort -s age data.csv              # Sort by a column
qsv frequency data.csv -s city        # Frequency table for a column
qsv slice -i 0-9 data.csv             # First 10 rows
qsv join --left name data1.csv name data2.csv   # Left join two CSVs
qsv count data.csv                    # Count rows
```

---

## ripgrep (rg) — grep Replacement

An extremely fast recursive search tool that respects `.gitignore`.

**When to use:** Searching for patterns in code or text files.

```bash
rg pattern                     # Search recursively in current directory
rg -i pattern                  # Case-insensitive search
rg -w word                     # Match whole words only
rg -l pattern                  # List only filenames with matches
rg -c pattern                  # Count matches per file
rg -t py pattern               # Search only Python files
rg -g '*.js' pattern           # Search only files matching a glob
rg -C 3 pattern                # Show 3 lines of context around matches
rg --no-ignore pattern         # Don't respect .gitignore
rg -F 'literal.string'        # Search for a fixed (non-regex) string
rg -e pattern1 -e pattern2    # Search for multiple patterns
rg -r 'replacement' pattern   # Search-and-replace (preview, doesn't modify)
```

---

## rnr — Batch Rename

A command-line tool for batch-renaming files using regex.

**When to use:** Renaming multiple files at once with pattern matching.

```bash
rnr 'foo' 'bar' *.txt          # Replace "foo" with "bar" in filenames (dry run)
rnr -f 'foo' 'bar' *.txt       # Actually perform the rename (-f = force)
rnr '(\d+)' '$1_v2' *.png      # Use regex capture groups
rnr -r 'old' 'new' .           # Recursive rename in current directory
```

---

## sd — sed Replacement

A simpler, more intuitive find-and-replace tool (uses regular string syntax by default).

**When to use:** Quick text replacements in files or piped input.

```bash
echo "hello world" | sd 'world' 'there'     # Simple string replacement
sd 'old' 'new' file.txt                      # Replace in a file (in-place)
sd -f i 'old' 'new' file.txt                 # Case-insensitive replacement
sd 'fn (\w+)' 'fn new_$1' file.rs           # Regex replacement with groups
echo '{"key": "val"}' | sd '"val"' '"new"'   # Replace in JSON
```

---

## sgpt — AI Command-Line Assistant

A command-line interface for interacting with AI models.

**When to use:** Getting AI-generated shell commands, code, or text from the terminal.

```bash
sgpt "explain kubernetes pods"        # Ask a question
sgpt --shell "list large files"       # Generate a shell command
sgpt --code "fizzbuzz in python"      # Generate code
```

---

## watchexec — File Watcher & Command Runner

Watches for file changes and re-runs a command automatically.

**When to use:** Auto-running tests, builds, or scripts when source files change.

```bash
watchexec -- cargo test                          # Re-run on any file change
watchexec -e py -- python test.py                # Watch only .py files
watchexec -e js,ts -- npm test                   # Watch multiple extensions
watchexec -w src/ -- make build                  # Watch specific directory
watchexec --restart -- python server.py          # Restart long-running process
watchexec -d 500 -- echo "changed"               # Debounce at 500ms
watchexec --ignore '*.log' -- make               # Ignore log files
```

---

## zoxide — cd Replacement

A smarter `cd` that learns your most-used directories.

**When to use:** Navigating to frequently visited directories with minimal typing.

```bash
z projects                     # Jump to best-matching directory
z proj code                    # Match on multiple path components
zi                             # Interactive selection with fzf
zoxide add /path/to/dir        # Manually add a directory
zoxide remove /path/to/dir     # Remove a directory from the database
zoxide query -ls               # List all tracked directories with scores
```
