# Context Discipline — Why and How

## The Problem

AI coding agents have a fixed context window. Every file read, command output, and conversation turn fills it up. When it overflows, the agent loses track of earlier instructions, makes contradictory decisions, and produces lower quality code.

The #1 cause of wasted context: **unbounded command output.**

A single `cat large_file.py` or `npm test` can dump 50,000+ tokens into context, pushing out the actual instructions and task context.

## The Rule: Byte-Cap Everything

Every command with unknown or potentially large output must be capped:

```bash
COMMAND 2>&1 | head -c 4000    # First 4KB
COMMAND 2>&1 | tail -c 4000    # Last 4KB (for logs)
```

### Why bytes, not lines?

Line limits (`head -n 20`) seem safe but aren't. A single line can be enormous — minified JSON, base64 data, or a log entry with a full stack trace. One "line" can be 100KB. Byte caps are absolute.

## Scope Before Printing

Before reading file contents, narrow down:

```bash
# Step 1: Find which files match
rg -l "search_term" src/ | head -c 2000

# Step 2: Count matches in relevant files
rg -c "search_term" src/relevant_file.py

# Step 3: Read only the relevant section
rg -n -m 10 "search_term" src/relevant_file.py 2>&1 | head -c 4000
```

## Common Patterns

### File inspection
```bash
wc -l file.py                           # Check size first
head -50 file.py                         # First 50 lines
sed -n '100,150p' file.py                # Specific range
```

### Git
```bash
git diff -- specific/file.py 2>&1 | head -c 6000    # Scoped diff
git log --oneline -10                                 # Recent history
```

### Test output
```bash
npm test 2>&1 | tail -c 4000            # Last 4KB (failures are at the end)
pytest specific_test.py 2>&1 | tail -c 4000
```

### Logs
```bash
tail -c 4000 /var/log/app/error.log     # Recent errors
journalctl -u myservice --since "1 hour ago" 2>&1 | tail -c 4000
```

### Database
```bash
mysql -e "SELECT * FROM users LIMIT 10"  # Always LIMIT
mysql -e "EXPLAIN SELECT ..." 2>&1 | head -c 4000
```

## Results

In real-world usage, enforcing byte-capped output reduces average token consumption by approximately 50% across comparable coding tasks. The quality of responses improves because the agent retains more of the actual task context instead of losing it to command dumps.
