# DevOps Challenge: The SysAdmin Starter Pack

A Bash automation script that sets up a structured project environment with proper file permissions — built as part of a DevOps mini-challenge.

## Challenge Goal

Automate common Linux administrative tasks: directory creation, file management, and permission settings using a single Bash script.

## Project Structure

```
devops_challenge/
├── setup_environment.sh   # Main automation script
├── logs/
│   └── system.log         # System log (permissions: 644)
├── configs/
│   └── app.conf           # App configuration (permissions: 444)
└── scripts/
    └── backup.sh          # Backup script (permissions: 755)
```

## What the Script Does

1. **Creates directories** (`logs/`, `configs/`, `scripts/`) — skips creation and prints a message if they already exist
2. **Creates files** with sample content if they don't exist
3. **Sets permissions**:
   - `logs/system.log` → `644` (rw-r--r--)
   - `configs/app.conf` → `444` (r--r--r--)
   - `scripts/backup.sh` → `755` (rwxr-xr-x)
4. **Displays** the directory tree and full permissions listing

## Usage

```bash
chmod +x setup_environment.sh
./setup_environment.sh
```

## Expected Output

```
Created directory: logs
Created directory: configs
Created directory: scripts

Directory Structure:
.
├── configs
│   └── app.conf
├── logs
│   └── system.log
└── scripts
    └── backup.sh

Permissions Overview:
-rw-r--r-- 1 user user  ...  logs/system.log
-r--r--r-- 1 user user  ...  configs/app.conf
-rwxr-xr-x 1 user user  ...  scripts/backup.sh
```

If run again on an existing setup:

```
Directory already exists: logs
Directory already exists: configs
Directory already exists: scripts
```

## Assessment Criteria

| Criteria | Points |
|---|---|
| Script executes without errors | 20 |
| Correct directory and file structure | 20 |
| Permissions set correctly | 20 |
| Handles existing directories gracefully | 20 |
| Output is clear and professional | 20 |
| **Total** | **100** |

## Screenshots

| Step | Screenshot |
|---|---|
| First run (creates structure) | `1.png` |
| Second run (handles existing dirs) | `2.png` |
