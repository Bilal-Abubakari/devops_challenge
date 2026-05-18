#!/bin/bash

# =============================================================
# Automates directory structure, file creation, and permissions
# =============================================================

# --- Directory creation with existence check ---
for dir in logs configs scripts; do
    if [ -d "$dir" ]; then
        echo "Directory already exists: $dir"
    else
        mkdir "$dir"
        echo "Created directory: $dir"
    fi
done

# --- File creation with sample content ---
if [ ! -f logs/system.log ]; then
    echo "System log initialized on $(date)" > logs/system.log
fi

if [ ! -f configs/app.conf ]; then
    echo "app_name=devops_starter" > configs/app.conf
fi

if [ ! -f scripts/backup.sh ]; then
    cat > scripts/backup.sh << 'EOF'
#!/bin/bash
echo "Backup script running on $(date)"
EOF
fi

# --- Set permissions ---
chmod 644 logs/system.log       # rw-r--r--
chmod 444 configs/app.conf      # r--r--r--
chmod 755 scripts/backup.sh     # rwxr-xr-x

# --- Display structure and permissions ---
echo ""
echo "Directory Structure:"
tree . 2>/dev/null || find . -not -path '*/\.*' | sort | sed 's|[^/]*/|  |g;s|  \([^/]*\)$|└── \1|'

echo ""
echo "Permissions Overview:"
ls -lR logs/ configs/ scripts/

